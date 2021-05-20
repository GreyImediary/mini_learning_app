import 'dart:async';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mini_learning_app/dio_client.dart';
import 'package:mini_learning_app/model/token/token.dart';
import 'package:mini_learning_app/shared_preferences/pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
  loginError,
  refreshError
}

class AuthRepository {
  final Dio dio;

  final _statusController = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    yield* _statusController.stream;
  }

  AuthRepository(this.dio);

  Future<void> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.data != null) {
        final token = Token.fromJson(response.data!);

        dio.options.headers['Authorization'] = 'Bearer ${token.accessToken}';

        await DioClient.saveTokenToPrefs(token);
        _statusController.add(AuthStatus.authenticated);
      }
    } on DioError {
      _statusController.add(AuthStatus.loginError);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    _statusController.add(AuthStatus.unauthenticated);
  }

  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString(PrefConst.refreshToken);
    final isUserLogged =  token != null &&
        prefs.getInt(PrefConst.userId) != null;

    if (isUserLogged) {
      if (!JwtDecoder.isExpired(token!)) {
        _statusController.add(AuthStatus.authenticated);
      } else {
        _statusController.add(AuthStatus.refreshError);
      }
    } else {
      _statusController.add(AuthStatus.unauthenticated);
    }
  }

  void dispose() => _statusController.close();
}
