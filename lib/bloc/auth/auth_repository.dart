import 'dart:async';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mini_learning_app/model/token/token.dart';
import 'package:mini_learning_app/pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { unknown, authenticated, unauthenticated, loginError, refreshError }

class AuthRepository {
  final Dio dio;
  final Dio tokenDio;

  final _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    yield* _controller.stream;
  }

  AuthRepository(this.dio, this.tokenDio) {
    tokenDio.interceptors.add(LogInterceptor());
    dio.interceptors
      ..add(LogInterceptor())
      ..add(
        InterceptorsWrapper(
          onError: (DioError e, handler) async {
            if (e.response?.statusCode == 403 ||
                e.response?.statusCode == 401) {
              await refreshToken();
              _retry(e.requestOptions);
            } else {
              handler.next(e);
            }
          },
        ),
      );
  }

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
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('RefreshToken') ?? '';

      Response<Map<String, dynamic>> response = await tokenDio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.data != null) {
        final token = Token.fromJson(response.data!);

        dio.options.headers['Authorization'] = 'Bearer ${token.accessToken}';

        await _saveToPrefs(token);
      }
    } on DioError {
      _controller.add(AuthStatus.refreshError);
    }
  }

  Future<void> _saveToPrefs(Token token) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(PrefConst.refreshToken, token.refreshToken);

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.accessToken);
    prefs.setInt(PrefConst.userId, decodedToken['sub'] as int);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  void dispose() => _controller.close();
}
