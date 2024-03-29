import 'dart:convert';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

import '../../models.dart';

class AreaRepositoryImp implements AreaRepository {
  String endPoint = '${baseURL}areas';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;

  @override
  Future<ApiResponse<List<AreaModel>>?> fetchArea(
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
          Uri.parse('$endPoint?sort=$sort&page=$page&limit=100'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<AreaModel>> apiResponse =
            ApiResponse<List<AreaModel>>.fromJson(result,
                (data) => data.map((e) => AreaModel.fromJson(e)).toList());
        print(apiResponse.result);
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
