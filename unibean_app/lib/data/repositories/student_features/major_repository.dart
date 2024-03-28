import 'dart:convert';

import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

class MajorRepositoryImp implements MajorRepository {
  String endPoint = '${baseURL}majors';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;

  @override
  Future<ApiResponse<List<MajorModel>>?> fetchMajors({int? page}) async {
    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};
      if (page == null) {
        page = this.page;
      }
      http.Response response = await http.get(
          Uri.parse('$endPoint?sort=$sort&page=$page&limit=100'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<MajorModel>> apiResponse =
            ApiResponse<List<MajorModel>>.fromJson(result,
                (data) => data.map((e) => MajorModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
