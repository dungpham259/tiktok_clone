import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok/features/app/models/user_model.dart';

abstract class FirebaseService {
  Stream<UserModel?> retrieveCurrentUser();

  Future<UserCredential?> signUp(UserModel user);

  Future<UserCredential?> signIn(UserModel user);

  Future<void> verifyEmail();

  Future<void> signOut();
}
