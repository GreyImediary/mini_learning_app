import 'package:dio/dio.dart';
import 'package:mini_learning_app/model/token/token.dart';
import 'package:mini_learning_app/shared_preferences/pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  static Dio get dio => getDio();
  static Dio? _dio;

  static Dio get tokenDio => getTokenDio();
  static Dio? _tokenDio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio()
        ..options.baseUrl = 'http://192.168.0.15:3000'
        ..interceptors.add(LogInterceptor())
        ..interceptors.add(
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

      return _dio!;
    } else {
      return _dio!;
    }
  }

  static Dio getTokenDio() {
    if (_tokenDio == null) {
      _tokenDio = Dio()
        ..options.baseUrl = 'http://192.168.0.10:3000'
        ..interceptors.add(LogInterceptor());

      return _tokenDio!;
    } else {
      return _tokenDio!;
    }
  }

  static Future<Token> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(PrefConst.refreshToken) ?? '';

    Response<Map<String, dynamic>> response = await tokenDio.post(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    final token = Token.fromJson(response.data!);

    dio.options.headers['Authorization'] = 'Bearer ${token.accessToken}';

    return token;
  }

  static Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
