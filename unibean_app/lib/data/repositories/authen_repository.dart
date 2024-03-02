import 'dart:convert';

import 'package:unibean_app/data/models/authen_model.dart';
import 'package:unibean_app/data/models/create_authen_model.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../presentation/config/constants.dart';
import '../datasource/authen_local_datasource.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepositoryImp implements AuthenticationRepository {
  String endPoint = '${baseURL}auths/mobile';
  late AuthenModel authenModel;
  @override
  Future<AuthenModel?> loginWithAccount(
      String userName, String password) async {
    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};

      Map<String, String> body = {'userName': userName, 'password': password};

      http.Response response = await http.post(Uri.parse('$endPoint/login'),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        this.authenModel = AuthenModel.fromJson(result);
        String authenString = jsonEncode(AuthenModel.fromJson(result));
        AuthenLocalDataSource.saveAuthen(authenString);
        AuthenLocalDataSource.saveToken(authenModel.jwt);
        return this.authenModel;
      }
      return null;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<AuthenModel?> loginWithGmail(String idToken) async {
    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};

      Map<String, String> body = {'idToken': idToken};

      http.Response response = await http.post(
          Uri.parse('$endPoint/login/google'),
          headers: headers,
          body: jsonEncode(body));

      if (response.statusCode == 200 || response.statusCode == 303) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        this.authenModel = AuthenModel.fromJson(result);
        String authenString = jsonEncode(AuthenModel.fromJson(result));
        AuthenLocalDataSource.saveAuthen(authenString);
        AuthenLocalDataSource.saveToken(authenModel.jwt);
        return this.authenModel;
      }
      return null;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> registerAccount(CreateAuthenModel createAuthenModel) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse('$endPoint/register'));

      //thêm file cho request
      request.files.add(await http.MultipartFile.fromPath(
          'StudentCardFront', createAuthenModel.studentFrontCard!));
      request.files.add(await http.MultipartFile.fromPath(
          'StudentCardBack', createAuthenModel.studentBackCard!));

      //thêm headers
      request.headers.addAll(headers);

      //thêm field cho request
      request.fields.addAll({
        'UserName': createAuthenModel.userName!,
        'Password': createAuthenModel.password!,
        'PasswordConfirmed': createAuthenModel.passwordConfirmed!,
        'MajorId': createAuthenModel.majorId!,
        'CampusId': createAuthenModel.campusId!,
        'FullName': createAuthenModel.fullName!,
        'Code': createAuthenModel.code!,
        'Gender': createAuthenModel.gender.toString(),
        'InviteCode': createAuthenModel.inviteCode!,
        'Email': createAuthenModel.email!,
        'DateOfBirth': createAuthenModel.dateofBirth!,
        'Phone': createAuthenModel.phoneNumber!,
        'Address': '',
        'Description': '',
        'State': 'true',
      });

      //gửi request
      var response = await request.send();

      if (response.statusCode == 201) {
        print(response);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
