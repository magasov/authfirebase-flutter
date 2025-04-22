import 'package:firebase_auth/firebase_auth.dart'; 

class UserModel {
  final String uid;
  final String email;
  final String? displayName;

  UserModel({required this.uid, required this.email, this.displayName});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
    );
  }
}
