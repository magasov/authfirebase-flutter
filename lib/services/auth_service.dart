import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> signInWithEmailPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }


  Future<void> logout() async {
    await _auth.signOut();
  }
<<<<<<< HEAD
=======

  User? get currentUser => _auth.currentUser;
>>>>>>> 14626d3c527fcc11f6585fbe6f78d70aeed3405e
}
