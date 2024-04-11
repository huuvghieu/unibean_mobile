import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/store_features/bonus_detail_model.dart';
import 'package:unibean_app/data/models/store_features/bonus_model.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/config/constants.dart';

class BonusRepositoryImp extends BonusRepository {
  String endPoint = '${baseURL}bonuses';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  bool state = true;
  String? token;

  @override
  Future<ApiResponse<List<BonusModel>>?> fecthBonuses(
      {int? page, int? limit}) async {
    try {
      final token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      final storeId = await AuthenLocalDataSource.getStoreId();
      if (page == null) {
        page = this.page;
      }
      if (limit == null) {
        limit = this.limit;
      }
      http.Response response = await http.get(
          Uri.parse(
              '$endPoint?storeIds=$storeId&state=$state&sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<BonusModel>> apiResponse =
            ApiResponse<List<BonusModel>>.fromJson(result,
                (data) => data.map((e) => BonusModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<BonusDetailModel?> fetchBonus({required String bonusId}) async {
    try {
      final token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endPoint/$bonusId'), headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        final apiResponse = BonusDetailModel.fromJson(result);
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
