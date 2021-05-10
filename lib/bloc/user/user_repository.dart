import 'package:dio/dio.dart';
import 'package:mini_learning_app/model/user/user.dart';
import 'package:mini_learning_app/shared_preferences/pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> saveToFavorite(int articleId) async {
    try {
      if (_user != null) {
        final response = await dio.post(
            '/user/${_user!.id}/articles/favorite/$articleId');

        if (response.statusCode == 200 || response.statusCode == 201) {
          return true;
        }
      }

      return false;
    } on DioError {
      return false;
    }
  }

  Future<User?> getCurrentUser() async {
      final prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt(PrefConst.userId) ?? -1;
      return getUserById(userId);
  }

  Future<bool> deleteFromFavorites(int articleId) async {
    try {
      if (_user != null) {
        final response = await dio.delete(
            '/user/${_user!.id}/articles/favorite/$articleId');

        if (response.statusCode == 200 || response.statusCode == 201) {
          return true;
        }
      }

      return false;
    } on DioError {
      return false;
    }
  }
}