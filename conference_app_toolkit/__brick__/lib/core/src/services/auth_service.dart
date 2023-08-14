import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService(this._auth);

  final FirebaseAuth _auth;

  User? get currentUser {
    return _auth.currentUser;
  }

  Stream<User?> get onAuthStateChanged {
    return _auth.authStateChanges();
  }

  Future<void> verifyUserEmail() async {
    if (!(currentUser?.emailVerified ?? false)) {
      await currentUser?.sendEmailVerification();
    }
  }

  /// Sign up a new user using email and passwork.
  ///
  /// Throws [FirebaseAuthException] if the operation fails.
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await verifyUserEmail();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await verifyUserEmail();
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
