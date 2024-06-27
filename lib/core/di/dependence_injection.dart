import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/dio_factory.dart';
import 'package:store/core/app/app_cubit/app_cubit.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:store/features/auth/signUp/logic/cubit/signup_cubit.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/auth/login/data/repositories/login_repository.dart';
import 'package:store/features/admin/dashboard/logic/users_number/users_cubit.dart';
import 'package:store/features/auth/signUp/data/repositories/signup_repository.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_cubit.dart';
import 'package:store/features/admin/dashboard/data/repositories/dashboard_repository.dart';
import 'package:store/features/admin/dashboard/logic/categories_number/categories_cubit.dart';
import 'package:store/core/app/upload_image/upload_image_repository.dart/upload_image_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  getIt.registerFactory<AppCubit>(() => AppCubit(dio));
  getIt.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<UploadImageRepository>(
      () => UploadImageRepository(getIt()));
  getIt.registerFactory<UploadImageCubit>(() => UploadImageCubit(getIt()));
  //Login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //signup
  getIt
      .registerLazySingleton<SignupRepository>(() => SignupRepository(getIt()));
  getIt..registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  //dashboard
  getIt
    ..registerLazySingleton<DashboardRepository>(
      () => DashboardRepository(getIt()),
    );
  getIt..registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  getIt..registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));
  getIt..registerFactory<UsersCubit>(() => UsersCubit(getIt()));
}
