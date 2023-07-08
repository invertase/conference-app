import { CloudTasksClient } from '@google-cloud/tasks';
import * as corsLib from 'cors';
import * as admin from 'firebase-admin';
import { firestore, messaging } from 'firebase-admin';
import * as functions from 'firebase-functions';
import config from './config';

const whitelist = ['http://localhost:8000'];

export const cors = corsLib({
  origin: whitelist,
});

/**
 * Initiate with a client for the Google Cloud Tasks API.
 */
export class CloudTask {
  queue: string;
  queuePath: string;
  taskClient: CloudTasksClient;
  project = config.projectId;
  location = config.location;

  /**
   * @param {string} queueName The name of the queue.
   */
  constructor(queueName: string) {
    this.queue = queueName;

    this.taskClient = new CloudTasksClient();
    this.queuePath = this.taskClient.queuePath(
      this.project,
      this.location,
      this.queue
    );
  }

  /**
   * Creates a cloud task for the given Firestore reference.
   *
   * @param {firestore.DocumentReference} ref
   * The reference to the document to create a task for.
   * @param {any} payload
   * The data to be in the payload of this task.
   * @param {Date} time The time when this task is to be triggered.
   * @param {string} functionName The name of the function that
   * will be triggered.
   */
  async createTaskForRefernce(
    ref: firestore.DocumentReference,
    payload: any,
    time: Date,
    functionName: string
  ) {
    const url = `https://${this.location}-${this.project}.cloudfunctions.net/${functionName}`;

    const task = {
      httpRequest: {
        httpMethod: 'POST' as const,
        url,
        body: Buffer.from(JSON.stringify(payload)).toString('base64'),
        headers: {
          'Content-Type': 'application/json',
        },
      },
      scheduleTime: {
        seconds: time.getTime() / 1000,
      },
    };

    const [response] = await this.taskClient.createTask({
      parent: this.queuePath,
      task,
    });

    await ref.update({
      scheduledTasks: firestore.FieldValue.arrayUnion(response.name),
    });
  }

  /**
   * @param {string} taskName The name of the task to cancel. If the task
   * was already done, this will function will throw.
   */
  async cancelTask(taskName: string) {
    await this.taskClient.deleteTask({ name: taskName });
  }
}

/**
 * Send a FCM message.
 *
 * @param {admin.messaging.Message} message The message to send.
 */
export async function sendMessage(message: admin.messaging.Message) {
  // Send a message to devices subscribed to this session reminders.
  await messaging()
    .send(message)
    .then((result) => {
      functions.logger.info('Successfully sent message:', result);
    })
    .catch((error) => {
      functions.logger.info('Error sending message:', error);
    });
}
