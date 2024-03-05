import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models.dart';

class AuthenLocalDataSource {
  AuthenLocalDataSource();

  static Future<void> saveToken(String token) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('token', token);
  }

  static Future<String?> getToken() async {
    final sf = await SharedPreferences.getInstance();
    String? token = sf.getString('token');
    return token;
  }

  static Future<void> saveStudentId(String studentId) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('studentId', studentId);
  }

  static Future<String?> getStudentId() async {
    final sf = await SharedPreferences.getInstance();
    String? token = sf.getString('studentId');
    return token;
  }

  static Future<void> saveVerificationId(String verificationId) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('verificationId', verificationId);
  }

  static Future<String?> getVerificationId() async {
    final sf = await SharedPreferences.getInstance();
    String? verificationId = sf.getString('verificationId');
    return verificationId;
  }

  static Future<void> saveAuthen(String authenString) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('authenString', authenString);
  }

  static Future<AuthenModel?> getAuthen() async {
    final sf = await SharedPreferences.getInstance();
    String? authenString = sf.getString('authenString');
    if (authenString == null) {
      return null;
    } else {
      Map<String, dynamic> json = jsonDecode(authenString);
      AuthenModel? authenModel = AuthenModel.fromJson(json);
      return authenModel;
    }
  }

  static Future<void> saveCreateAuthen(String authenString) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('createAuthenString', authenString);
  }

  static Future<CreateAuthenModel?> getCreateAuthen() async {
    final sf = await SharedPreferences.getInstance();
    String? authenString = sf.getString('createAuthenString');
    if (authenString == null) {
      return null;
    } else {
      Map<String, dynamic> json = jsonDecode(authenString);
      CreateAuthenModel? createAuthenModel = CreateAuthenModel.fromJson(json);
      return createAuthenModel;
    }
  }

  static Future<void> removeAuthen() async {
    final sf = await SharedPreferences.getInstance();
    sf.remove('authenString');
  }

  static Future<void> clearAuthen() async {
    final sf = await SharedPreferences.getInstance();

    await sf.clear();
  }
}
