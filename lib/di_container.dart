import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/login/data/data_source/remote/dio_client.dart';
import 'features/login/data/data_source/remote/dio_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/data/repository/LoginRepositoryImpl.dart';
import 'features/login/domain/repository/login_repo.dart';
import 'features/login/domain/usecase/login_usecase.dart';
import 'features/login/presentation/provider/LoginProvider.dart';


final sl = GetIt.instance;

Future<void> init() async {

  //base
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerSingleton<Dio>(Dio());
  sl.registerLazySingleton(() => DioInterceptor());
  sl.registerLazySingleton(() => DioClient(dio: sl(), dioInterceptor: sl(), ));


  // Dependencies
  sl.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<LoginUseCase>(
      LoginUseCase(sl())
  );


  // Provider
  sl.registerFactory(() => LoginProvider(
      loginUseCase: sl(),
      sharedPreferences: sl()
  ));

}