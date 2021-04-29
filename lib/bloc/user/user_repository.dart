import 'package:dio/dio.dart';
import 'package:mini_learning_app/model/user/user.dart';

class UserRepository {
  final Dio dio;
  User? _user;

  UserRepository(this.dio);

  Future<User?> getUserById(int id) async {
    if (_user != null) {
      return _user;
    }

    try {
      final response = await dio.get('/user/$id');

      if (response.data != null) {
        _user = User.fromJson(response.data!);

        return _user;
      }
    } on DioError {
      return null;
    }
  }
}