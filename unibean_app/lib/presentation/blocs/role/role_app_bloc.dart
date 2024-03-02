import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'role_app_event.dart';
part 'role_app_state.dart';

class RoleAppBloc extends Bloc<RoleAppEvent, RoleAppState> {
  final StudentRepository studentRepository;
  RoleAppBloc(this.studentRepository) : super(RoleAppUnknown()) {
    on<RoleAppStart>(_onStartRoleApp);
    on<RoleAppEnd>(_onEndRoleApp);
  }

  Future<void> _onStartRoleApp(
      RoleAppStart event, Emitter<RoleAppState> emit) async {
    emit(RoleAppLoading());
    try {
      final authenModel = await AuthenLocalDataSource.getAuthen();
      if (authenModel == null) {
        emit(RoleAppUnknown());
      } else {
        final student = await studentRepository.fetchStudentById(
            id: authenModel.userModel.userId);
        bool isVerify = authenModel.userModel.isVerify;
        String role = authenModel.role;
        String state = authenModel.userModel.state;
        String description = authenModel.userModel.description;
        if (role == 'Student' &&
            isVerify == true &&
            student != null &&
            (state == 'Active' || state == 'IsActive')) {
          emit(RoleAppStudentVerified(
              authenModel: authenModel, studentModel: student));
        } 
        else if (role == 'Student' &&
            description == 'Create by logging in with Google') {
          emit(RoleAppStudentUnverified(
              authenModel: authenModel));
        } 
        else if (role == 'Student' &&
            isVerify == false &&
            student != null &&
            (state == 'Pending' || state == 'Rejected')) {
          emit(RoleAppStudentUnverified(
              authenModel: authenModel));
        } 
        else if (role == 'Store') {
          emit(RoleAppStore());
        } 
        else {
          emit(RoleAppUnknown());
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onEndRoleApp(
      RoleAppEnd event, Emitter<RoleAppState> emit) async {
    try {
      AuthenLocalDataSource.removeAuthen();
      emit(RoleAppUnknown());
    } catch (e) {
      print(e);
    }
  }
}
