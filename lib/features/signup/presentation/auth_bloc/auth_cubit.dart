import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_current_uid_usecase.dart';
import '../../domain/usecases/is_login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsLoginUseCase isLoginUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  AuthCubit({
    required this.isLoginUseCase,
    required this.getCurrentUidUseCase,
  }) : super(AuthInitial());

  Future<void> AppStarted() async {
    try {
      final isLogin = await isLoginUseCase.call();
      if (isLogin == true) {
        final currentUid = await getCurrentUidUseCase.call();

        emit(Authenticated(uid: currentUid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    final currentUid = await getCurrentUidUseCase.call();
    emit(Authenticated(uid: currentUid));
  }

  Future<void> loggedOut() async {
    emit(UnAuthenticated());
  }
}
