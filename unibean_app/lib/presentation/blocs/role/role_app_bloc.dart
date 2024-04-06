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
  final StoreRepository storeRepository;
  RoleAppBloc(this.studentRepository, this.storeRepository) : super(RoleAppLoading()) {
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
    
      String userId = authenModel.userModel.userId;
      if (userId != '') {
        final student = await studentRepository.fetchStudentById(
            id: authenModel.userModel.userId);
        if (role == 'Student') {
          if (isVerify) {
              String stateName = student!.state;
            if (stateName == 'Active') {
              emit(Verified(authenModel: authenModel, studentModel: student));
            } else if (stateName == 'Pending') {
              emit(Pending(authenModel: authenModel, studentModel: student));
            } else if(stateName == 'Rejected') {
              emit(Rejected(authenModel: authenModel, studentModel: student));
            }else{
              
            }
          } else {
            emit(Unverified(authenModel: authenModel));
          }
        } else {
          final store = await storeRepository.fetchStoreById(
              storeId: authenModel.userModel.userId);
          emit(StoreRole(authenModel: authenModel,storeModel: store!));
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
