import 'package:unibean_app/data/models.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  Future<AuthenModel?> loginWithAccount(String userName, String password);

  Future<AuthenModel?> loginWithGmail(String idToken);

  Future<bool> registerAccount(CreateAuthenModel createAuthenModel);
  
  Future<bool> verifyAccount(VerifyAuthenModel verifyAuthenModel);
}
