import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../data/models.dart';

part 'role_app_event.dart';
part 'role_app_state.dart';

class RoleAppBloc extends Bloc<RoleAppEvent, RoleAppState> {
  final StudentRepository studentRepository;
  RoleAppBloc(this.studentRepository) : super(RoleAppLoading()) {
    on<RoleAppStart>(_onStartRoleApp);
    on<RoleAppEnd>(_onEndRoleApp);
  }

  Future<void> _onStartRoleApp(
      RoleAppStart event, Emitter<RoleAppState> emit) async {
    emit(RoleAppLoading());
    try {
      final authenModel = await AuthenLocalDataSource.getAuthen();

      bool isVerify = authenModel!.userModel.isVerify;
      String role = authenModel.role;
      String state = authenModel.userModel.state;
      String userId = authenModel.userModel.userId;

      if (userId != '') {
        final student = await studentRepository.fetchStudentById(
            id: authenModel.userModel.userId);
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
        } else {
          emit(StoreRole());
        }
      } else {
        emit(Unverified(authenModel: authenModel));
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
      if (googleSignIn.currentUser != null) {
        await googleSignIn.disconnect();
        await FirebaseAuth.instance.signOut();
      }

      // emit(Unknown());
    } catch (e) {
      print(e);
    }
  }
}
