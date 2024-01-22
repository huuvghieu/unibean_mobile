import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/repositories.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  final ValidationRepository validationRepository;
  var box = Hive.box('myBox');
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
        box.put('emailSignUp', email);
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
        box.put('userNameSignUp', userName);
        emit(CheckUserNameSuccess());
        return '';
      } else {
        emit(CheckEmailFailed(error: check, check: false));
        return check;
      }
    } catch (e) {}
    return null;
  }
}
