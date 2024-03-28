import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/student_features/challenge_model.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/config/constants.dart';

class ChallengeRepositoryImp extends ChallengeRepository {
  String endPoint = '${baseURL}students';
  String? token;
  String? studentId;
  String sort = 'Id%2Casc';
  int page = 1;
  int limit = 10;

  @override
  Future<ApiResponse<List<ChallengeModel>>?> fecthChallenges(
      {int? page, int? limit}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      studentId = await AuthenLocalDataSource.getStudentId();

      if (page == null) {
        page = this.page;
      }

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse(
              '$endPoint/$studentId/challenges?sort=$sort&page=$page&limit=100'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<ChallengeModel>> apiResponse =
            ApiResponse<List<ChallengeModel>>.fromJson(result,
                (data) => data.map((e) => ChallengeModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
