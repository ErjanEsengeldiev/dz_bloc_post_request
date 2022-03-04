import 'package:bloc_post_request/data/entity/user/user.dart';
import 'package:dio/dio.dart';

const baseUrl = 'https://reqres.in/api/users';

class UserApiProvider {
  Future<User> postUser({required String name, required String job}) async {
    final Response response = await Dio().post(
      baseUrl,
      data: {'name': name, 'job': job},
    );
    return User.fromJson(response.data);
  }

  Future<UserEdit> putUser({required String name, required String job}) async {
    final Response response = await Dio().put(
      baseUrl,
      data: {'name': name, 'job': job},
    );
    return UserEdit.fromJson(response.data);
  }

  Future<User> delateUser({required String name, required String job}) async {
    final Response response = await Dio().delete(
      baseUrl,
      data: {'name': name, 'job': job},
    );
    if (response.statusCode == 204) {
      return User.fromJson(response.data);
    } else {
      throw Exception('');
    }
  }
}
