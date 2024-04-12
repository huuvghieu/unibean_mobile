import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

import '../../models.dart';

class BrandRepositoryImp implements BrandRepository {
  String endPoint = '${baseURL}brands';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  bool state = true;
  String? token;

  @override
  Future<ApiResponse<List<BrandModel>>?> fecthBrands(
      {int? page, int? limit}) async {
    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};
      if (page == null) {
        page = this.page;
      }
      if (limit == null) {
        limit = this.limit;
      }
      http.Response response = await http.get(
          Uri.parse(
              '$endPoint?state=$state&sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<BrandModel>> apiResponse =
            ApiResponse<List<BrandModel>>.fromJson(result,
                (data) => data.map((e) => BrandModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<BrandModel?> fecthBrandById({required String id}) async {
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
        BrandModel brandModel = BrandModel.fromJson(result);
        return brandModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponse<List<VoucherModel>>?> fecthVouchersByBrandId(
      int? page, int? limit,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {'Content-Type': 'application/json'};
      if (page == null) {
        page = this.page;
      }
      if (limit == null) {
        limit = this.limit;
      }

      http.Response response = await http.get(
          Uri.parse(
              '$endPoint/$id/vouchers?state=$state&sort=$sort&page=$page&limit=$limit'),
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
  Future<ApiResponse<List<CampaignModel>>?> fecthCampaignssByBrandId(
      int? page, int? limit,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {'Content-Type': 'application/json'};
      if (page == null) {
        page = this.page;
      }
      if (limit == null) {
        limit = this.limit;
      }
      final studentModel = await AuthenLocalDataSource.getStudent();
      if (studentModel == null) {
        http.Response response = await http.get(
            Uri.parse(
                '$endPoint/$id/campaigns?stateIds=3&sort=$sort&page=$page&limit=$limit'),
            headers: headers);

        if (response.statusCode == 200) {
          final result = jsonDecode(utf8.decode(response.bodyBytes));
          ApiResponse<List<CampaignModel>> apiResponse =
              ApiResponse<List<CampaignModel>>.fromJson(
                  result,
                  (data) =>
                      data.map((e) => CampaignModel.fromJson(e)).toList());
          return apiResponse;
        } else {
          return null;
        }
      } else {
        String majorId = studentModel.majorId;
        String campusId = studentModel.campusId;
        http.Response response = await http.get(
            Uri.parse(
                '$endPoint/$id/campaigns?majorIds=$majorId&campusIds=$campusId&stateIds=3&sort=$sort&page=$page&limit=$limit'),
            headers: headers);

        if (response.statusCode == 200) {
          final result = jsonDecode(utf8.decode(response.bodyBytes));
          ApiResponse<List<CampaignModel>> apiResponse =
              ApiResponse<List<CampaignModel>>.fromJson(
                  result,
                  (data) =>
                      data.map((e) => CampaignModel.fromJson(e)).toList());
          return apiResponse;
        } else {
          return null;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
