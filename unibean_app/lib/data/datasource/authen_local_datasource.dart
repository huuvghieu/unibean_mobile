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

    static Future<void> saveStudent(String studentString) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('studentString', studentString);
  }

  static Future<StudentModel?> getStudent() async {
    final sf = await SharedPreferences.getInstance();
    String? studentString = sf.getString('studentString');
    if (studentString == null) {
      return null;
    } else {
      Map<String, dynamic> json = jsonDecode(studentString);
      StudentModel? studentModel = StudentModel.fromJson(json);
      return studentModel;
    }
  }

  static Future<void> saveUser(String userString) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('userString', userString);
  }

  static Future<UserModel?> getUser() async {
    final sf = await SharedPreferences.getInstance();
    String? userString = sf.getString('userString');
    if (userString == null) {
      return null;
    } else {
      Map<String, dynamic> json = jsonDecode(userString);
      UserModel? userModel = UserModel.fromJson(json);
      return userModel;
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

  static Future<void> saveVerifyAuthen(String verifyAuthenString) async {
    final sf = await SharedPreferences.getInstance();
    await sf.setString('verifyAuthenString', verifyAuthenString);
  }

  static Future<VerifyAuthenModel?> getVerifyAuthen() async {
    final sf = await SharedPreferences.getInstance();
    String? verifyAuthenString = sf.getString('verifyAuthenString');
    if (verifyAuthenString == null) {
      return null;
    } else {
      Map<String, dynamic> json = jsonDecode(verifyAuthenString);
      VerifyAuthenModel? verifyAuthenModel = VerifyAuthenModel.fromJson(json);
      return verifyAuthenModel;
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
