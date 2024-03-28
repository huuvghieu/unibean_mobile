
abstract class VerificationRepository {
  const VerificationRepository();

  Future<bool> verifyOTP(String verificationId, String smsOTP);
  
  // Future<void> verify
}
