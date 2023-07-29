import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_client/rest_client.dart';
import 'package:tiktok/data/repositories/user/remote/user_reposiory.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    Dio dio,
  ) : _userApiClient = UserApiClient(dio);

  late final UserApiClient _userApiClient;

  @override
  Future<UserResponse> getUserList({int? page}) async {
    return _userApiClient.getUserList(page: page);
  }
}
