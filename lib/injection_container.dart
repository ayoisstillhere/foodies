import 'package:foodies/features/signup/data/datasources/firebase_remote_datasource.dart';
import 'package:foodies/features/signup/data/repositories/firebase_repository_impl.dart';
import 'package:foodies/features/signup/domain/repositories/firebase_repository.dart';
import 'package:foodies/features/signup/domain/usecases/create_current_user_usecase.dart';
import 'package:foodies/features/signup/domain/usecases/get_current_uid_usecase.dart';
import 'package:foodies/features/signup/domain/usecases/is_login_usecase.dart';
import 'package:foodies/features/signup/domain/usecases/login_usecase.dart';
import 'package:foodies/features/signup/domain/usecases/signup_usecase.dart';
import 'package:foodies/features/signup/presentation/auth_bloc/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features bloc,
  sl.registerFactory(() =>
      AuthCubit(isLoginUseCase: sl.call(), getCurrentUidUseCase: sl.call()));

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

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDataSource: sl.call()));

  //datasource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl());

  //external
  //e.g final shared Preference = await SharedPreferences.getInstance();
}
