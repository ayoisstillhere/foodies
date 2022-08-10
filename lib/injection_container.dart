import 'package:foodies/features/add_order/domain/usecases/place_order_usecase.dart';
import 'package:get_it/get_it.dart';

import 'features/home/presentation/bloc/user_bloc/user_cubit.dart';
import 'features/login/presentation/login_cubit/login_cubit.dart';
import 'features/signup/data/datasources/firebase_remote_datasource.dart';
import 'features/signup/data/repositories/firebase_repository_impl.dart';
import 'features/signup/domain/repositories/firebase_repository.dart';
import 'features/signup/domain/usecases/create_current_user_usecase.dart';
import 'features/signup/domain/usecases/get_current_uid_usecase.dart';
import 'features/signup/domain/usecases/get_users_usecase.dart';
import 'features/signup/domain/usecases/is_login_usecase.dart';
import 'features/signup/domain/usecases/login_usecase.dart';
import 'features/signup/domain/usecases/signup_usecase.dart';
import 'features/signup/presentation/auth_bloc/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features bloc,
  sl.registerFactory<AuthCubit>(() =>
      AuthCubit(isLoginUseCase: sl.call(), getCurrentUidUseCase: sl.call()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(
      signupUseCase: sl.call(),
      loginUseCase: sl.call(),
      createCurrentUserUsecase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(usersUsecase: sl.call()));

  //!useCae
  sl.registerLazySingleton<IsLoginUseCase>(
      () => IsLoginUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<CreateCurrentUserUsecase>(
      () => CreateCurrentUserUsecase(repository: sl.call()));
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUsersUsecase>(
      () => GetUsersUsecase(repository: sl.call()));
  sl.registerLazySingleton<PlaceOrderUseCase>(
      () => PlaceOrderUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDataSource: sl.call()));

  //datasource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl());

  //external
  //e.g final shared Preference = await SharedPreferences.getInstance();
}
