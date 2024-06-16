import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/dio_factory.dart';
import 'package:store/core/networking/app_cubit/app_cubit.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:store/features/auth/login/data/repositories/login_repository.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerFactory<AppCubit>(() => AppCubit(dio));
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //Login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory <LoginCubit>(() => LoginCubit(getIt()));
}
