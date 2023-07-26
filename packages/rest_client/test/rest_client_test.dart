import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rest_client/rest_client.dart';

void main() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
    ),
  );

  final UserApiClient userApiClient = UserApiClient(dio);

  test('test', () async {
    final userList = await userApiClient.getUserList();

    expect(userList.data, isNotEmpty);
  });
}
