import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';

import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

import '../../models.dart';

class StationRepositoryImp implements StationRepository {
  String endPoint = '${baseURL}stations';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  bool state = true;
  String? token;

  @override
  Future<ApiResponse<List<StationModel>>?> fetchStation(
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
          Uri.parse('$endPoint?stateIds=1&sort=$sort&page=$page&limit=100'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<StationModel>> apiResponse =
            ApiResponse<List<StationModel>>.fromJson(result,
                (data) => data.map((e) => StationModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
