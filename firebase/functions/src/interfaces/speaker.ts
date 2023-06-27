export interface Speaker {
  id: string;
  firstName: string;
  lastName: string;
  fullName: string;
  bio: string;
  tagLine: string;
  profilePicture: string;
  isTopSpeaker: boolean;
  links: Array<Record<string, any>>;
  sessions: Array<number>;
  questionAnswers?: Array<Record<string, any>>;
}

