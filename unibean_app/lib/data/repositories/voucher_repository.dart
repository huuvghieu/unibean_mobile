import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';

import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

import '../models.dart';

class VoucherRepositoryImp implements VoucherRepository {
  String endPoint = '${baseURL}vouchers';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  String? token;

  @override
  Future<ApiResponse<List<VoucherModel>>?> fetchVouchers(
      {int? page, int? limit}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      if (page == null) {
        page = this.page;
      }
      http.Response response = await http.get(
          Uri.parse('$endPoint?sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<VoucherModel>> apiResponse =
            ApiResponse<List<VoucherModel>>.fromJson(result,
                (data) => data.map((e) => VoucherModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<VoucherDetailModel?> fetchVoucherById(
      {required String voucherId}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endPoint/$voucherId'), headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        VoucherDetailModel voucherDetailModel =
            VoucherDetailModel.fromJson(result);
        return voucherDetailModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
