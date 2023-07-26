import 'package:rest_client/rest_client.dart';

mixin UserRepository {
  Future<UserResponse> getUserList({int? page});
}
