import 'session.dart';
import 'speaker.dart';

class SessionDetails {
  final Session session;
  final List<Speaker> speakers;

  SessionDetails({
    required this.session,
    required this.speakers,
  });
}
