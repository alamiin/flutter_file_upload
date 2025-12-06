
import 'package:dio/dio.dart';

import '../../../../../core/constants/constants.dart';
import 'dio_interceptor.dart';


class DioClient {


  final Dio dio;
  final DioInterceptor dioInterceptor;
  DioClient({required this.dio, required this.dioInterceptor}) {
    dio
      ..options.baseUrl = loginBaseUrl
      ..options.connectTimeout = const Duration(milliseconds: 3000)
      ..options.receiveTimeout = const Duration(milliseconds: 3000)
      ..httpClientAdapter
      ..interceptors.add(dioInterceptor);
  }

  Future<Response> post( {required String uri, required Map<String, dynamic> body}) async {
    var response = await dio.post(
        uri,
        data : body
    );
    return response;
  }

}
