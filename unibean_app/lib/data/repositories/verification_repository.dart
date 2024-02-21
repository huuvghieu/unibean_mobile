// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unibean_app/domain/repositories.dart';

class VerificationRepositoryImp implements VerificationRepository {
  @override
  Future<bool> verifyOTP(String verificationId, String smsOTP) async {
    var credentials = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsOTP));
    if (credentials.user != null) {
      return true;
    }
    return false;
  }
}
