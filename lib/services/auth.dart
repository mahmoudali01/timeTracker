import 'package:firebase_auth/firebase_auth.dart';

abstract class authBase {
  User get currentUser;
  Future<User> signInAnonymously();
  Future<void> signOut();
  Stream<User> authStateChanges();
}

class Auth implements authBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User get currentUser => _firebaseAuth.currentUser;
  @override
  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();
  @override
  Future<User> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
