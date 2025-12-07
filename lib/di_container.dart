import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/data_source/remote/dio_client.dart';
import 'core/data/data_source/remote/dio_interceptor.dart';
import 'core/data/data_source/remote/token/TokenStorage.dart';
import 'features/dashboard/data/repository/file_list_repository_impl.dart';
import 'features/dashboard/domain/repository/file_list_repository.dart';
import 'features/dashboard/domain/usecase/file_list_usecase.dart';
import 'features/dashboard/presentation/provider/dashboard_provider.dart';
import 'features/login/data/repository/LoginRepositoryImpl.dart';
import 'features/login/domain/repository/login_repo.dart';
import 'features/login/domain/usecase/login_usecase.dart';
import 'features/login/presentation/provider/LoginProvider.dart';


final sl = GetIt.instance;

Future<void> init() async {

  //base
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerSingleton<TokenStorage>(TokenStorage( sl()));
  sl.registerSingleton<Dio>(Dio());
  sl.registerLazySingleton(() => DioInterceptor(sl()));
  sl.registerLazySingleton(() => DioClient(dio: sl(), dioInterceptor: sl(), sharedPreferences: sl()));


  // Dependencies
  sl.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(sl())
  );
  sl.registerSingleton<FileListRepository>(
      FileListRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<LoginUseCase>(
      LoginUseCase(sl())
  );
  sl.registerSingleton<FileListUseCase>(
      FileListUseCase(sl())
  );


  // Provider
  sl.registerFactory(() => LoginProvider(
      loginUseCase: sl(),
      sharedPreferences: sl()
  ));
  sl.registerFactory(() => DashboardProvider(
      fileListUseCase: sl()
  ));

}