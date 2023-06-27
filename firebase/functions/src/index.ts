import * as admin from 'firebase-admin';

admin.initializeApp();

import {
  roomsToFirestore,
  sessionsToFirestore,
  speakersToFirestore,
} from './api_to_firestore';
import {
  cleanupAfterSessionsDeletion,
  rescheduleSessionReminders,
  scheduleSessionReminders,
} from './session_firestore_triggers';
import {
  sendSessionTenMinsReminder,
  sessionGone,
  sessionStartedReminder,
} from './session_task_triggers';

export {
  cleanupAfterSessionsDeletion,
  rescheduleSessionReminders,
  roomsToFirestore,
  scheduleSessionReminders,
  sendSessionTenMinsReminder,
  sessionGone,
  sessionStartedReminder,
  sessionsToFirestore,
  speakersToFirestore,
};
