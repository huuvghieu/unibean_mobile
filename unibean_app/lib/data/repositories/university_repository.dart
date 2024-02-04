import 'dart:convert';

import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/university_model.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:http/http.dart' as http;

class UniversityRepositoryImp implements UniversityRepository {
  String endPoint = '${baseURL}universities';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;

  @override
  Future<ApiResponse<List<UniversityModel>>?> fetchUnversities(
      {int? page}) async {
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
        ApiResponse<List<UniversityModel>> apiResponse =
            ApiResponse<List<UniversityModel>>.fromJson(
                result,
                (data) =>
                    data.map((e) => UniversityModel.fromJson(e)).toList());
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
