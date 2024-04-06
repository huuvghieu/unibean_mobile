import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../config/constants.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitial()) {
    on<StartAuthen>(_onStartAuthen);
    on<LoginAccount>(_onLoginAccount);
    on<LoginGmail>(_onLoginGmail);
    on<RegisterAccount>(_onRegisterAccount);
    on<VerifyAccount>(_onVerifyAccount);
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
        if (authenModel.userModel.state == 'Inactive') {
          emit(AuthenticationFailed(error: 'Tài khoản không còn hoạt động'));
        } else {
          if (authenModel.role == 'Student') {
            emit(AuthenticationSuccess());
          } else {
            emit(AuthenticationStoreSuccess());
          }
        }
      } else {
        emit(
            AuthenticationFailed(error: 'Tài khoản hoặc mật khẩu không đúng!'));
      }
    } catch (e) {
      emit(AuthenticationFailed(error: e.toString()));
    }
  }

  Future<void> _onLoginGmail(
      LoginGmail event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationInProcessByGmail());

    // final auth = await FirebaseAuth.instance;
    try {
      //select google account
      final userAccount = await googleSignIn.signIn();

      //get authendication object from account
      final GoogleSignInAuthentication googleAuthen =
          await userAccount!.authentication;

      //create OAuthCredentials from auth Object
      // ignore: unused_local_variable
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuthen.accessToken, idToken: googleAuthen.idToken);

      //Login to firebase using the credentials
      // final userCredential = await auth.signInWithCredential(credential);

      String idToken = googleAuthen.idToken.toString();

      print(idToken);

      var authenModel = await authenticationRepository.loginWithGmail(idToken);
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

  Future<void> _onRegisterAccount(
      RegisterAccount event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationInProcess());
    try {
      var registerCheck = await authenticationRepository
          .registerAccount(event.createAuthenModel);
      if (registerCheck) {
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationFailed(error: 'Đăng ký thất bại!'));
      }
    } catch (e) {
      emit(AuthenticationFailed(error: e.toString()));
    }
  }

  Future<void> _onVerifyAccount(
      VerifyAccount event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationInProcess());
    try {
      var verifyCheck =
          await authenticationRepository.verifyAccount(event.verifyAuthenModel);
      if (verifyCheck) {
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationFailed(error: 'Đăng ký thất bại!'));
      }
    } catch (e) {
      emit(AuthenticationFailed(error: e.toString()));
    }
  }
}
