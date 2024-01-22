abstract class ValidationRepository {
  const ValidationRepository();

  Future<String> validateEmail({required String email});

  Future<String> validateUserName({required String userName});
}
