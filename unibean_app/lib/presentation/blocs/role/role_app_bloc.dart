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
      final student = await
          studentRepository.fetchStudentById(id: authenModel!.userModel.userId);
      bool isVerify = authenModel.userModel.isVerify;
      String role = authenModel.role;
      if (role == 'Student' && isVerify == true && student != null) {
        emit(RoleAppStudentVerified(authenModel: authenModel,
        studentModel: student));
      } else if (role == 'Student' && isVerify == false) {
        emit(RoleAppStudentUnverified());
      } else if (role == 'Store') {
        emit(RoleAppStore());
      } else {
        emit(RoleAppUnknown());
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
