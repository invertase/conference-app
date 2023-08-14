import { firestore } from 'firebase-admin';
import * as functions from 'firebase-functions';
import config from './config';
import { Session, SessionStatus } from './interfaces/session';
import { CloudTask } from './utils';

/**
 * Schedules a notification to be sent to the topic of the session.
 *
 * @param {firestore.DocumentReference} ref
 * The reference to the session record.
 * @param {Session} session The session data.
 */
export async function createSessionTasks(
  ref: firestore.DocumentReference,
  session: Session
) {
  functions.logger.info('Scheduling notifications for session ' + session.id);

  const scheduledTasks = session.scheduledTasks;

  const sessionReminderCloudTask = new CloudTask(config.sessionsTaskQueue);

  if (scheduledTasks) {
    functions.logger.info('Canceling previous tasks ' + session.id);
    for (const scheduledTask of scheduledTasks) {
      await sessionReminderCloudTask
        .cancelTask(scheduledTask)
        .catch((error) => {
          functions.logger.error(error);
        });
    }
  }

  try {
    await sessionReminderCloudTask.createTaskForRefernce(
      ref,
      {
        sessionId: session.id,
        sessionTitle: session.title,
        sessionRoomId: session.roomId,
      },
      new Date(session.startsAt.toDate().getTime() - 1000 * 600),
      'sendSessionTenMinsReminder'
    );

    await sessionReminderCloudTask.createTaskForRefernce(
      ref,
      {
        sessionId: session.id,
        sessionTitle: session.title,
        sessionRoomId: session.roomId,
      },
      session.startsAt.toDate(),
      'sessionStartedReminder'
    );

    await sessionReminderCloudTask.createTaskForRefernce(
      ref,
      {
        sessionId: session.id,
      },
      session.endsAt.toDate(),
      'sessionGone'
    );

    functions.logger.info(`Created 2 tasks for ${session.id}`);
  } catch (e) {
    functions.logger.error(e);
  }
}

/**
 *  Update the status of a session.
 *
 * @param {firestore.DocumentReference} ref
 * The reference to the session to be updated.
 * @param {SessionStatus} status The new status.
 */
export async function updateSessionStatus(
  ref: firestore.DocumentReference,
  status: SessionStatus
) {
  await ref.update({ status });
}
