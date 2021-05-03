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
  final Dio tokenDio;

  final _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    yield* _controller.stream;
  }

  AuthRepository(this.dio, this.tokenDio);

  Future<void> login(String email, String password) async {
    try {
      final response = await tokenDio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.data != null) {
        final token = Token.fromJson(response.data!);

        dio.options.headers['Authorization'] = 'Bearer ${token.accessToken}';

        await _saveToPrefs(token);
        _controller.add(AuthStatus.authenticated);
      }
    } on DioError {
      _controller.add(AuthStatus.loginError);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    _controller.add(AuthStatus.unauthenticated);
  }

  Future<void> refreshToken() async {
    try {
      final Token token = await DioClient.refreshToken();
      await _saveToPrefs(token);
    } on DioError {
      _controller.add(AuthStatus.refreshError);
    }
  }

  Future<void> _saveToPrefs(Token token) async {
    final prefs = await SharedPreferences.getInstance();

    print('ACCESS ${token.accessToken}');
    print('REFRESH ${token.refreshToken}');

    prefs.setString(PrefConst.refreshToken, token.refreshToken);

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.accessToken);
    prefs.setInt(PrefConst.userId, decodedToken['sub'] as int);
  }

  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString(PrefConst.refreshToken);
    final isUserLogged =  token != null &&
        prefs.getInt(PrefConst.userId) != null;

    if (isUserLogged) {
      if (!JwtDecoder.isExpired(token!)) {
        _controller.add(AuthStatus.authenticated);
      } else {
        _controller.add(AuthStatus.refreshError);
      }
    } else {
      _controller.add(AuthStatus.unauthenticated);
    }
  }

  void dispose() => _controller.close();
}
