import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok/features/app/models/user_model.dart';
import 'package:tiktok/features/auth/networking/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Stream<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String?> retrieveUserName(UserModel user) {
    // TODO: implement retrieveUserName
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signIn(UserModel user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
