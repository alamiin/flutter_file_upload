import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/login/data/data_source/remote/dio_client.dart';
import 'features/login/data/data_source/remote/dio_interceptor.dart';



final sl = GetIt.instance;

Future<void> init() async {

  //base
  sl.registerSingleton<Dio>(Dio());
  sl.registerLazySingleton(() => DioInterceptor());
  sl.registerLazySingleton(() => DioClient(dio: sl(), dioInterceptor: sl(), ));

}