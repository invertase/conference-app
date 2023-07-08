import * as admin from 'firebase-admin';

export interface Session {
  id: string;
  title: string;
  description: string;
  startsAt: admin.firestore.Timestamp;
  endsAt: admin.firestore.Timestamp;
  isServiceSession: boolean;
  isPlenumSession: boolean;
  speakers: Array<string>;
  categoryItems: Array<string>;
  sessionRoomId: string;
  liveUrl: string;
  recordingUrl: string;
  scheduledTasks: Array<string>;
  status: SessionStatus;
  roomId: string;
}

export enum SessionStatus {
  upcoming = 'upcoming',
  gone = 'gone',
  live = 'live',
}
