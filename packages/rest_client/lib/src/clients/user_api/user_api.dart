import 'package:dio/dio.dart';
import 'package:rest_client/rest_client.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String baseUrl}) = _UserApiClient;

  @GET('/users?page={page}')
  Future<UserResponse> getUserList({@Path("page") int? page});
}
