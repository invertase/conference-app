import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';
import config from './config';
import { SessionStatus } from './interfaces/session';
import { updateSessionStatus } from './session_utils';
import { sendMessage } from './utils';

/**
 * The screen to which to navigate the user
 * in the app receiving the notification.
 */
export enum NotificationScreen {
  session = 'session',
}

/**
 * The action of this notification, which determines whaty to do with
 * the notification and data on te client side.
 */
export enum NotificationAction {
  /**
   * Navigate to a screen in the app.
   */
  navigate = 'navigate',
  /**
   * Show a dialog in the app.
   */
  dialog = 'dialog',
  /**
   * Do not show anything to user, however, use this type
   * if you want to do some processing in the app like invalidating cache
   * or refetching data.
   */
  silent = 'silent',
}

export const sessionStartedReminder = functions
  .region(config.location)
  .https.onRequest(async (request, response) => {
    const body = request.body;
    const sessionId = body.sessionId;
    const sessionTitle = body.sessionTitle;
    const sessionRoomId = body.sessionRoomId;

    // Get the room name.
    const roomRef = await admin.firestore().doc(`rooms/${sessionRoomId}`).get();
    const room = roomRef.data() as { name: string };

    const topic = sessionId;

    const message = {
      topic: topic,
      notification: {
        title: 'Session just started!',
        body:
          `The session ${sessionTitle} ` +
          `in room ${room.name} is starting now`,
      },
      data: {
        title: 'Session just started!',
        body:
          `The session ${sessionTitle} ` +
          `in room ${room.name} is starting now`,
        sessionId: sessionId,
        action: NotificationAction.dialog,
        screen: NotificationScreen.session,
        click_action: 'FLUTTER_NOTIFICATION_CLICK',
      },
    };

    await sendMessage(message);

    // Update status in the session document.
    await updateSessionStatus(
      admin.firestore().doc(`sessions/${sessionId}`),
      SessionStatus.live
    );

    response.sendStatus(200);
  });

export const sendSessionTenMinsReminder = functions
  .region(config.location)
  .https.onRequest(async (request, response) => {
    const body = request.body;
    const sessionId = body.sessionId;
    const sessionTitle = body.sessionTitle;
    const sessionRoomId = body.sessionRoomId;

    // Get the room name.
    const roomRef = await admin.firestore().doc(`rooms/${sessionRoomId}`).get();
    const room = roomRef.data() as { name: string };

    const topic = sessionId;

    const message = {
      notification: {
        title: 'Session is about to start!',
        body:
          `10 mintues left for the session ${sessionTitle} ` +
          `in room ${room.name}`,
      },
      data: {
        title: 'Session is about to start!',
        body:
          `10 mintues left for the session ${sessionTitle} ` +
          `in room ${room.name}`,
        sessionId: sessionId,
        action: NotificationAction.navigate,
        screen: NotificationScreen.session,
        click_action: 'FLUTTER_NOTIFICATION_CLICK',
      },
      topic: topic,
    };

    // Send a message to devices subscribed to this session reminders.
    await sendMessage(message);

    response.sendStatus(200);
  });

export const sessionGone = functions
  .region(config.location)
  .https.onRequest(async (request, response) => {
    const body = request.body;
    const sessionId = body.sessionId;

    // Update status in the session document.
    await updateSessionStatus(
      admin.firestore().doc(`sessions/${sessionId}`),
      SessionStatus.gone
    );

    response.sendStatus(200);
  });
