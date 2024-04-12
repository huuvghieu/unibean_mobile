import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

import '../../models.dart';

class CampaignRepositoryImp implements CampaignRepository {
  String endPoint = '${baseURL}campaigns';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 3;
  String? token;

  @override
  Future<ApiResponse<List<CampaignModel>>?> fecthCampaigns(
      {int? page, int? limit}) async {
    try {
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
                '$endPoint?stateIds=3&sort=$sort&page=$page&limit=$limit'),
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
                '$endPoint?majorIds=$majorId&campusIds=$campusId&stateIds=3&sort=$sort&page=$page&limit=$limit'),
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

  @override
  Future<CampaignDetailModel?> fecthCampaignById({required String id}) async {
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
        CampaignDetailModel campaignDetailModel =
            CampaignDetailModel.fromJson(result);
        return campaignDetailModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponse<List<CampaignStoreModel>>?> fecthCampaignStoreById(
      int? page, int? limit,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      if (page == null) {
        page = this.page;
      }
      if (limit == null) {
        limit = this.limit;
      }
      http.Response response = await http.get(
          Uri.parse('$endPoint/$id/stores?sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<CampaignStoreModel>> apiResponse =
            ApiResponse<List<CampaignStoreModel>>.fromJson(
                result,
                (data) =>
                    data.map((e) => CampaignStoreModel.fromJson(e)).toList());
        print(apiResponse.result);
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiResponse<List<CampaignVoucherModel>>?> fecthCampaignVouchersById(
      int? page, int? limit,
      {required String id}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      if (page == null) {
        page = this.page;
      }
      if (limit == null) {
        limit = this.limit;
      }

      http.Response response = await http.get(
          Uri.parse('$endPoint/$id/details?sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<CampaignVoucherModel>> apiResponse =
            ApiResponse<List<CampaignVoucherModel>>.fromJson(
                result,
                (data) =>
                    data.map((e) => CampaignVoucherModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CampaignVoucherDetailModel?> fecthCampaignVoucherDetailById(
      {required String campaignId, required String campaignVoucherId}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      http.Response response = await http.get(
          Uri.parse('$endPoint/$campaignId/details/$campaignVoucherId'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        CampaignVoucherDetailModel campaignVoucherDetailModel =
            CampaignVoucherDetailModel.fromJson(result);
        return campaignVoucherDetailModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> redeemCampaignVoucher(
      {required String campaignId,
      required String campaignVoucherId,
      required String studentId,
      required int quantity,
      required String description}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      Map body = {
        'studentId': studentId,
        'quantity': quantity,
        'description': description,
        "state": true
      };
      http.Response response = await http.post(
          Uri.parse('$endPoint/$campaignId/details/$campaignVoucherId'),
          body: jsonEncode(body),
          headers: headers);

      if (response.statusCode == 201) {
        return null;
      } else {
        return response.body;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
