import axios from 'axios';
import * as admin from 'firebase-admin';
import {
  DocumentData,
  FirestoreDataConverter,
  Timestamp,
} from 'firebase-admin/firestore';
import * as functions from 'firebase-functions';
import config from './config';
import { Room } from './interfaces/room';
import { Session } from './interfaces/session';
import { Speaker } from './interfaces/speaker';

const genericConverter = <T>(): FirestoreDataConverter<T> => ({
  toFirestore(modelObject: T): DocumentData {
    return modelObject as unknown as DocumentData;
  },
  fromFirestore(data: DocumentData): T {
    return data as unknown as T;
  },
});

/**
 * Get sessions and speakers from sessionize API.
 * @return {Promise<any>} The data extracted from
 * the response returned from the sessionize API.
 */
const getSessionizeData = async (): Promise<any> => {
  if (process.env.SESSIONIZE_ENDPOINT) {
    // First, get the sessionize data.
    const { data } = await axios.get(process.env.SESSIONIZE_ENDPOINT);
    return data;
  }
};

/**
 * Get rooms from sessionize API then copy them into a Firestore collection.
 * This function can only be called by an authorized account from the GCP CLI.
 *
 * ```bash
 * gcloud functions call roomsToFirestore
 * \ --region europe-west3
 * \ --data "{\"data\":\"\"}"
 * ```
 */
export const roomsToFirestore = functions
  .region(config.location)
  .https.onRequest(async (_, response) => {
    const data = await getSessionizeData();

    const roomsFirestore = admin
      .firestore()
      .collection('rooms')
      .withConverter(genericConverter<Room>());

    data['rooms'].map(async (room: Room) => {
      functions.logger.debug(room.id);
      const roomsRef = roomsFirestore.doc(room.id.toString());
      await roomsRef.set(room);
      functions.logger.info(`🎉 Room added successfully: ${room.name}`);
    });

    response.sendStatus(200);
  });

/**
 * Get speakers from sessionize API then copy them into a Firestore collection.
 * This function can only be called by an authorized account from the GCP CLI.
 *
 * ```bash
 * gcloud functions call speakersToFirestore
 * \ --region europe-west3
 * \ --data "{\"data\":\"\"}"
 * ```
 */
export const speakersToFirestore = functions
  .region(config.location)
  .https.onRequest(async (_, response) => {
    const data = await getSessionizeData();

    const speakerFirestore = admin
      .firestore()
      .collection('speakers')
      .withConverter(genericConverter<Speaker>());

    const batch = admin.firestore().batch();

    for (const speaker of data['speakers']) {
      if (
        speaker.questionAnswers &&
        speaker.questionAnswers.length > 0 &&
        speaker.questionAnswers[0].questionId == 37750
      ) {
        speaker.links.push({
          title: 'GitHub',
          linkType: 'GitHub',
          url: speaker.questionAnswers[0].answerValue,
        });
      }

      if (speaker.questionAnswers) {
        delete speaker.questionAnswers;
      }

      const speakerRef = speakerFirestore.doc(speaker.id);
      batch.set(speakerRef, speaker);
      functions.logger.info(
        `🎉 Speaker added successfully: ${speaker.fullName}`
      );
    }

    await batch.commit();

    response.sendStatus(200);
  });

/**
 * Get sessions from sessionize API then copy them into a Firestore collection.
 * This function can only be called by an authorized account from the GCP CLI.
 *
 * ```bash
 * gcloud functions call sessionsToFirestore
 * \ --region europe-west3
 * \ --data "{\"data\":\"\"}"
 * ```
 */
export const sessionsToFirestore = functions
  .region(config.location)
  .https.onRequest(async (_, response) => {
    const data = await getSessionizeData();

    const sessionFirestore = admin
      .firestore()
      .collection('sessions')
      .withConverter(genericConverter<Session>());

    const batch = admin.firestore().batch();

    for (const session of data['sessions']) {
      if (session && session.startsAt) {
        const startsAt = new Date(session.startsAt);
        session.startsAt = Timestamp.fromDate(startsAt);
      }

      if (session && session.endsAt) {
        const endsAt = new Date(session.endsAt as string);
        session.endsAt = Timestamp.fromDate(endsAt);
      }

      batch.set(sessionFirestore.doc(session.id), session);
      functions.logger.info(`🎉 Session added successfully: ${session.title}`);
    }

    await batch.commit();

    response.sendStatus(200);
  });
