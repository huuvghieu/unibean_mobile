import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/student_features/create_model/create_order_model.dart';
import 'package:unibean_app/data/models/student_features/order_detail_model.dart';
import 'package:unibean_app/data/models/student_features/order_model.dart';
import 'package:unibean_app/data/models/student_features/student_model.dart';
import 'package:unibean_app/data/models/student_features/transaction_model.dart';
import 'package:unibean_app/data/models/student_features/voucher_student_item_model.dart';
import 'package:unibean_app/data/models/student_features/voucher_student_model.dart';
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
  bool state = true;
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
      int? page, int? limit, String? search,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = await AuthenLocalDataSource.getStudentId();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      if (search != null) {
        http.Response response = await http.get(
            Uri.parse(
                '$endPoint/$id/vouchers?sort=$sort&search=$search&page=$page&limit=$limit'),
            headers: headers);
        if (response.statusCode == 200) {
          final result = jsonDecode(utf8.decode(response.bodyBytes));
          ApiResponse<List<VoucherStudentModel>> apiResponse =
              ApiResponse<List<VoucherStudentModel>>.fromJson(
                  result,
                  (data) => data
                      .map((e) => VoucherStudentModel.fromJson(e))
                      .toList());
          return apiResponse;
        } else {
          return null;
        }
      } else if (search == null || search == '') {
        http.Response response = await http.get(
            Uri.parse(
                '$endPoint/$id/vouchers?sort=$sort&page=$page&limit=$limit'),
            headers: headers);
        if (response.statusCode == 200) {
          final result = jsonDecode(utf8.decode(response.bodyBytes));
          ApiResponse<List<VoucherStudentModel>> apiResponse =
              ApiResponse<List<VoucherStudentModel>>.fromJson(
                  result,
                  (data) => data
                      .map((e) => VoucherStudentModel.fromJson(e))
                      .toList());
          return apiResponse;
        } else {
          return null;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
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
                '$endPoint/$id/histories?state=$state&sort=$sort&page=$page&limit=$limit'),
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
                '$endPoint/$id/histories?state=$state&typeIds=$typeIds&sort=$sort&page=$page&limit=$limit'),
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
          Uri.parse(
              '$endPoint/$id/orders?state=$state&sort=$sort&page=$page&limit=$limit'),
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

  @override
  Future<List<String>?> fetchWishListByStudentId() async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = (await AuthenLocalDataSource.getStudentId())!;
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http
          .get(Uri.parse('$endPoint/$studentId/wishlists'), headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> jsonReponse = jsonDecode(response.body);
        List<String> result =
            jsonReponse.map((item) => item.toString()).toList();
        return result;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<OrderModel?> createOrder(CreateOrderModel createOrderModel) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = (await AuthenLocalDataSource.getStudentId())!;
      Map body = {
        'stationId': createOrderModel.stationId,
        'amount': createOrderModel.amount,
        'description': "Cảm ơn Unibean",
        'state': createOrderModel.state,
        'orderDetails': createOrderModel.orderDetails,
      };

      http.Request req = http.Request(
        'Post',
        Uri.parse('$endPoint/$studentId/orders'),
      );
      req.headers['Content-Type'] = 'application/json';
      req.headers['Authorization'] = 'Bearer $token';
      req.body = jsonEncode(body);
      final streamedResponse = await http.Client().send(req);
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        OrderModel apiResponse = OrderModel.fromJson(result);
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<StudentModel?> putVerification(
      {required String studentId,
      required String studentCode,
      required String studentCardFont,
      required String studentCardBack}) async {
    try {
      final token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'PUT', Uri.parse('$endPoint/$studentId/verification'));

      //thêm file cho request
      request.files.add(await http.MultipartFile.fromPath(
          'StudentCardFront', studentCardFont));
      request.files.add(await http.MultipartFile.fromPath(
          'StudentCardBack', studentCardBack));

      //thêm headers
      request.headers.addAll(headers);

      //thêm field cho request
      request.fields.addAll({
        'Code': studentCode,
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
      throw Exception(e.toString());
    }
  }

  @override
  Future<OrderDetailModel?> fetchOrderDetailByStudentId(
      {required String studentId, required String orderId}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = (await AuthenLocalDataSource.getStudentId())!;
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse('$endPoint/$studentId/orders/$orderId'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        OrderDetailModel apiResponse = OrderDetailModel.fromJson(result);
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
