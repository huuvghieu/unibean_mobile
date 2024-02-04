import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../domain/repositories.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  final ValidationRepository validationRepository;
  ValidationCubit(this.validationRepository) : super(ValidationInitial());

  void loadingValidation() {
    emit(ValidationInitial());
  }

  Future<String?> validateEmail(String email) async {
    emit(ValidationInProcess());
    try {
      final check = await validationRepository.validateEmail(email: email);
      print(check);
      if (check == '') {
        emit(CheckEmailSuccess());
        return '';
      } else {
        emit(CheckEmailFailed(error: check, check: false));
        return check;
      }
    } catch (e) {}
    return null;
  }

  Future<String?> validateUserName(String userName) async {
    emit(ValidationInProcess());
    try {
      final check =
          await validationRepository.validateUserName(userName: userName);
      print(check);
      if (check == '') {
        emit(CheckUserNameSuccess());
        return '';
      } else {
        emit(CheckUserNameFailed(error: check, check: false));
        return check;
      }
    } catch (e) {}
    return null;
  }

  Future<String?> validateStudentCode(String studentCode) async {
    emit(ValidationInProcess());
    try {
      var check = await validationRepository.validateStudentCode(
          studentCode: studentCode);
      print(check);
      if (check == '') {
        emit(CheckStudentCodeSuccess());
        return '';
      } else {
        if (check == invalidStudentCode) {
          check = 'Mã sinh viên đã được sử dụng';
        }
        emit(CheckInvitedCodeFailed(error: check, check: false));
        return check;
      }
    } catch (e) {}
    return null;
  }

  Future<String?> validatePhoneNumber(String phone) async {
    emit(ValidationInProcess());
    try {
      var check =
          await validationRepository.validatePhoneNumber(phoneNumber: phone);
      print(check);
      if (check == '') {
        emit(CheckStudentCodeSuccess());
        return '';
      } else {
        // if (check == invalidStudentCode) {
        //   check = 'Mã sinh viên đã được sử dụng';
        // }
        emit(CheckInvitedCodeFailed(error: check, check: false));
        return check;
      }
    } catch (e) {}
    return null;
  }
}
