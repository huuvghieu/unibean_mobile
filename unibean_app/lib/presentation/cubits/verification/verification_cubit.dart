import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/datasource/authen_local_datasource.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationRepository verificationRepository;
  VerificationCubit(this.verificationRepository) : super(VerificationInitial());

  void loadingVerification() {
    emit(VerificationInitial());
  }

  Future<bool?> verifyOTP( String smsOTP) async {
    emit(VerificationInProcess());
    try {
      final verificationId = await AuthenLocalDataSource.getVerificationId();
      final check =
          await verificationRepository.verifyOTP(verificationId!, smsOTP);
      print(check);
      if (check) {
        emit(OTPVerificationSuccess());
        return check;
      } else {
        emit(OTPVerificationFailed());
        return false;
      }
    } catch (e) {}
    return null;
  }
}
