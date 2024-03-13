import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/student_model.dart';
import 'package:unibean_app/data/models/transaction_model.dart';
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
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
