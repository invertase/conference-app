import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:conference_app/core/core.dart';

final authService = Provider((ref) => AuthService(FirebaseAuth.instance));

final authStateProvider =
    StreamProvider<User?>((ref) => ref.watch(authService).onAuthStateChanged);

final userProvider =
    StateProvider<User?>((ref) => ref.watch(authStateProvider).value);

final userInstanceProvider =
    StateProvider<User?>((ref) => ref.watch(authService).currentUser);

final emailVerifiedProvider =
    StateProvider<bool?>((ref) => ref.watch(userProvider)?.emailVerified);
