import 'package:dio/dio.dart';


class DioInterceptor extends InterceptorsWrapper {


  DioInterceptor();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    options.headers['Authorization'] = 'Basic Y2xpZW50OnNlY3JldA==';
    return super.onRequest(options, handler);
  }

}
