import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';
import config from './config';
import { Session, SessionStatus } from './interfaces/session';
import { createSessionTasks, updateSessionStatus } from './session_utils';
import { CloudTask } from './utils';

export const scheduleSessionReminders = functions
  .region(config.location)
  .firestore.document('/sessions/{sessionId}')
  .onCreate(async (document) => {
    const startsAt = document.data().startsAt as admin.firestore.Timestamp;

    if (startsAt) {
      // If the session is gone, don't schedule anything.
      if (startsAt.toDate() < new Date()) {
        await document.ref.update({ status: SessionStatus.gone });
        return;
      }

      // If the session starts in the future, schedule a notification.
      await updateSessionStatus(document.ref, SessionStatus.upcoming);
      await createSessionTasks(document.ref, document.data() as Session);
    }
  });

export const rescheduleSessionReminders = functions
  .region(config.location)
  .firestore.document('/sessions/{sessionId}')
  .onUpdate(async (change) => {
    const startsAtOld = change.before.data()
      .startsAt as admin.firestore.Timestamp;
    const startsAtNew = change.after.data()
      .startsAt as admin.firestore.Timestamp;

    // In case the session start time changed,
    // we need to reschedule the notifications.
    if (
      !startsAtOld.isEqual(startsAtNew) &&
      startsAtNew.toDate().getTime() > new Date().getTime()
    ) {
      await createSessionTasks(
        change.after.ref,
        change.after.data() as Session
      );
    }
  });

/**
 * If the sessions was removed for any reason,
 * cancel any tasks that were scheduled.
 */
export const cleanupAfterSessionsDeletion = functions
  .region(config.location)
  .firestore.document('/sessions/{sessionId}')
  .onDelete(async (document) => {
    const scheduledTasks = (document.data() as Session).scheduledTasks;
    const sessionReminderCloudTask = new CloudTask(config.sessionsTaskQueue);

    if (scheduledTasks) {
      functions.logger.info(
        'Canceling previous tasks for document ' + document.id
      );
      for (const scheduledTask of scheduledTasks) {
        await sessionReminderCloudTask
          .cancelTask(scheduledTask)
          .then(() => {
            functions.logger.info(`Deleted task ${scheduledTask}`);
          })
          .catch((error) => {
            functions.logger.warn(`The task was not cancelled: ${error}`);
          });
      }
    } else {
      functions.logger.info('No tasks to cancel, aborting.');
    }
  });
