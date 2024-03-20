import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'role_app_event.dart';
part 'role_app_state.dart';

class RoleAppBloc extends Bloc<RoleAppEvent, RoleAppState> {
  final StudentRepository studentRepository;
  RoleAppBloc(this.studentRepository) : super(Unknown()) {
    on<RoleAppStart>(_onStartRoleApp);
    on<RoleAppEnd>(_onEndRoleApp);
  }

  Future<void> _onStartRoleApp(
      RoleAppStart event, Emitter<RoleAppState> emit) async {
    emit(RoleAppLoading());
    try {
      final authenModel = await AuthenLocalDataSource.getAuthen();
      if (authenModel == null) {
        emit(Unknown());
      } else {
        final student = await studentRepository.fetchStudentById(
            id: authenModel.userModel.userId);

        bool isVerify = authenModel.userModel.isVerify;
        String role = authenModel.role;
        String state = authenModel.userModel.state;
        // String description = authenModel.userModel.description;

        if (role == 'Student') {
          if (isVerify) {
            if (state == 'Active') {
              emit(Verified(authenModel: authenModel, studentModel: student!));
            } else if (state == 'Pending') {
              emit(Pending(authenModel: authenModel, studentModel: student!));
            } else {
              emit(Rejected(authenModel: authenModel, studentModel: student!));
            }
          } else {
            emit(Unverified(authenModel: authenModel));
          }
        }
        //Store
        else if (role == 'Store') {
          emit(StoreRole());
        }
        //unknown
        else {
          emit(Unknown());
        }
        // if (role == 'Student' &&
        //     isVerify == true &&
        //     student != null &&
        //     state == 'Active') {
        //   emit(Verified(
        //       authenModel: authenModel, studentModel: student));
        // } else if (role == 'Student' && isVerify == false &&
        //     description == 'Create by logging in with Google') {
        //   emit(Unverified(authenModel: authenModel));
        // } else if (role == 'Student' &&
        //     isVerify == false &&
        //     student != null &&
        //     (state == 'Pending' || state == 'Rejected')) {
        //   emit(Unverified(authenModel: authenModel));
        // }

        // else if (role == 'Student' &&
        //     isVerify == true &&
        //     student != null &&
        //     (state == 'Pending' || state == 'Rejected')) {
        //   emit(Verified(
        //       authenModel: authenModel, studentModel: student));
        // }

        // else if (role == 'Store') {
        //   emit(StoreRole());
        // } else {
        //   emit(Unknown());
        // }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onEndRoleApp(
      RoleAppEnd event, Emitter<RoleAppState> emit) async {
    try {
      AuthenLocalDataSource.removeAuthen();
      AuthenLocalDataSource.clearAuthen();
      // GoogleSignIn _googleSignIn = GoogleSignIn();
      // if()
      // await _googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      emit(Unknown());
    } catch (e) {
      print(e);
    }
  }
}
