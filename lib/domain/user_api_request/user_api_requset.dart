import 'package:bloc_post_request/data/entity/user/user.dart';
import 'package:dio/dio.dart';

class UserApiProvider {
  Future<User> postUser({required String name, required String job}) async {
    final Response response = await Dio().post(
      'https://reqres.in/api/users',
      data: {'name': name, 'job': job},
    );
    return User.fromJson(response.data);
  }

  User? getUser() {}
}
