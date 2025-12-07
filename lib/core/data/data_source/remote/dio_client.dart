
import 'package:dio/dio.dart';
import 'package:flutter_file_upload/core/data/data_source/remote/token/TokenType.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/constants.dart';

import 'dio_interceptor.dart';


class DioClient {


  final Dio dio;
  final DioInterceptor dioInterceptor;
  final SharedPreferences sharedPreferences;
  DioClient({required this.dio, required this.dioInterceptor, required this.sharedPreferences}) {
    dio
      ..options.baseUrl = loginBaseUrl
      ..options.connectTimeout = const Duration(milliseconds: 3000)
      ..options.receiveTimeout = const Duration(milliseconds: 3000)
      ..interceptors.add(dioInterceptor);
  }

  Future<Response> post( {required String uri, required Map<String, dynamic> body}) async {
    Options options = Options(extra: {'tokenType': TokenType.publicToken},);
    var response = await dio.post(
        uri,
        data : body,
      options: options,
    );
    return response;
  }

  Future<Response> get( {required String uri}) async {
    Options options = Options(extra: {'tokenType': TokenType.accessToken},);
    var response = await dio.get(
        uri,
      options: options,
    );
    return response;
  }

}
