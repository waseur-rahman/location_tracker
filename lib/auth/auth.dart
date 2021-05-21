import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final firebaseUser = _auth.currentUser;

  static Future<User> login(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
