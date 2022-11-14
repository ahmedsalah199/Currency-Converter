import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/dio_helper.dart';
import '../data/repository.dart';
import '../presentation/cubit/cubit_app/app_cubit.dart';

var instance = GetIt.instance;

Future<void> init() async {
  // bloc
  instance.registerFactory(() => AppCubit(repository: instance()));

  // features
  // dio helper
  instance.registerLazySingleton(() => DioHelper(dio: Dio()));
  // repository
  instance.registerLazySingleton(() => Repository(dioHelper: instance()));

  // external
  instance.registerLazySingleton<Dio>(() => Dio());
}
