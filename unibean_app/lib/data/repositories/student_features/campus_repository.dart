import 'dart:convert';

import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/student_features/campus_model.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

class CampusRepositoryImp implements CampusRepository {
  String endPoint = '${baseURL}campuses';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  bool state = true;
  @override
  Future<ApiResponse<List<CampusModel>>?> fetchCampusByUniId(
      {int? page, required String uniId}) async {
    try {
      final Map<String, String> headers = {'Content-Type': 'application/json'};
      if (page == null) {
        page = this.page;
      }
      http.Response response = await http.get(
          Uri.parse(
              '$endPoint?state=$state&universityIds=$uniId&sort=$sort&page=$page&limit=100'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<CampusModel>> apiResponse =
            ApiResponse<List<CampusModel>>.fromJson(result,
                (data) => data.map((e) => CampusModel.fromJson(e)).toList());
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
