import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/order_model.dart';
import 'package:unibean_app/data/models/student_model.dart';
import 'package:unibean_app/data/models/transaction_model.dart';
import 'package:unibean_app/data/models/voucher_student_item_model.dart';
import 'package:unibean_app/data/models/voucher_student_model.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

class StudentRepositoryImp implements StudentRepository {
  String endPoint = '${baseURL}students';
  String? token;
  String? studentId;
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  @override
  Future<StudentModel?> fetchStudentById({required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endPoint/$id'), headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        StudentModel studentModel = StudentModel.fromJson(result);
        String studentString = jsonEncode(StudentModel.fromJson(result));
        AuthenLocalDataSource.saveStudent(studentString);
        return studentModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponse<List<VoucherStudentModel>>?> fetchVoucherStudentId(
      int? page, int? limit,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = await AuthenLocalDataSource.getStudentId();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse(
              '$endPoint/$id/vouchers?sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<VoucherStudentModel>> apiResponse =
            ApiResponse<List<VoucherStudentModel>>.fromJson(
                result,
                (data) =>
                    data.map((e) => VoucherStudentModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponse<List<TransactionModel>>?> fetchTransactionsStudentId(
      int? page, int? limit, int? typeIds,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = await AuthenLocalDataSource.getStudentId();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      if (typeIds == 0) {
        http.Response response = await http.get(
            Uri.parse(
                '$endPoint/$id/histories?sort=$sort&page=$page&limit=$limit'),
            headers: headers);
        if (response.statusCode == 200) {
          final result = jsonDecode(utf8.decode(response.bodyBytes));
          ApiResponse<List<TransactionModel>> apiResponse =
              ApiResponse<List<TransactionModel>>.fromJson(
                  result,
                  (data) =>
                      data.map((e) => TransactionModel.fromJson(e)).toList());
          return apiResponse;
        } else {
          return null;
        }
      } else {
        http.Response response = await http.get(
            Uri.parse(
                '$endPoint/$id/histories?typeIds=$typeIds&sort=$sort&page=$page&limit=$limit'),
            headers: headers);
        if (response.statusCode == 200) {
          final result = jsonDecode(utf8.decode(response.bodyBytes));
          ApiResponse<List<TransactionModel>> apiResponse =
              ApiResponse<List<TransactionModel>>.fromJson(
                  result,
                  (data) =>
                      data.map((e) => TransactionModel.fromJson(e)).toList());
          return apiResponse;
        } else {
          return null;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponse<List<OrderModel>>?> fetchOrdersStudentId(
      int? page, int? limit,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = await AuthenLocalDataSource.getStudentId();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse('$endPoint/$id/orders?sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<OrderModel>> apiResponse =
            ApiResponse<List<OrderModel>>.fromJson(result,
                (data) => data.map((e) => OrderModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool?> postChallengeStudentId(
      {required String studentId, required String challengeId}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = (await AuthenLocalDataSource.getStudentId())!;
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      http.Response response = await http.post(
          Uri.parse('$endPoint/$studentId/challenges/$challengeId'),
          headers: headers);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<StudentModel?> putStudent(
      {required String studentId,
      required String fullName,
      required String majorId,
      required String campusId,
      required int gender,
      required String avatar,
      required String address}) async {
    try {
      final authenModel = await AuthenLocalDataSource.getAuthen();
      final accountId = authenModel!.userModel.id;
      final token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request =
          http.MultipartRequest('PUT', Uri.parse('$endPoint/$studentId'));

      //thêm file cho request
      if (avatar != '') {
        request.files.add(await http.MultipartFile.fromPath('Avatar', avatar));
      }

      //thêm headers
      request.headers.addAll(headers);

      //thêm field cho request
      request.fields.addAll({
        'MajorId': majorId,
        'CampusId': campusId,
        'FullName': fullName,
        'Gender': gender.toString(),
        'AccountId': accountId,
        'Address': address,
      });

      //gửi request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print(response);
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        StudentModel studentModel = StudentModel.fromJson(result);

        String studentString = jsonEncode(StudentModel.fromJson(result));
        AuthenLocalDataSource.saveStudent(studentString);
        return studentModel;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  @override
  Future<VoucherStudentItemModel?> fetchVoucherItemByStudentId(
      {required String studentId, required String voucherId}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = (await AuthenLocalDataSource.getStudentId())!;
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse('$endPoint/$studentId/vouchers/$voucherId'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        VoucherStudentItemModel apiResponse =
            VoucherStudentItemModel.fromJson(result);
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
