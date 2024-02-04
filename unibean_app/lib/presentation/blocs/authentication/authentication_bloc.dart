import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitial()) {
    on<StartAuthen>(_onStartAuthen);
    on<LoginAccount>(_onLoginAccount);
  }
  Future<void> _onStartAuthen(
      StartAuthen event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationInitial());
  }

  Future<void> _onLoginAccount(
      LoginAccount event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationInProcess());
    try {
      var authenModel = await authenticationRepository.loginWithAccount(
          event.userName, event.password);
      if (authenModel != null) {
        emit(AuthenticationSuccess());
      } else {
        emit(
            AuthenticationFailed(error: 'Tài khoản hoặc mật khẩu không đúng!'));
      }
    } catch (e) {
      emit(AuthenticationFailed(error: e.toString()));
    }
  }
}
