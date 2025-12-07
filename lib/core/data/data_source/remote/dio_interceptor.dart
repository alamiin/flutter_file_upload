import 'package:dio/dio.dart';

import 'token/TokenStorage.dart';
import 'token/TokenType.dart';



class DioInterceptor extends Interceptor {
  final TokenStorage tokenStorage;

  DioInterceptor(this.tokenStorage);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    final tokenType = options.extra['tokenType'] as TokenType?;

    switch (tokenType) {
      case TokenType.accessToken:
        final token = tokenStorage.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        break;

      case TokenType.refreshToken:
        final token = tokenStorage.getRefreshToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        break;

      case TokenType.publicToken:
        options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        options.headers['Authorization'] = 'Basic Y2xpZW50OnNlY3JldA==';
      default:
      // No auth header
        break;
    }

    handler.next(options);
  }
}
