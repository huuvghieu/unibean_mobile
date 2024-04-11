import 'dart:convert';

import 'package:unibean_app/domain/repositories.dart';
import '../../../presentation/config/constants.dart';
import '../../datasource/authen_local_datasource.dart';
import 'package:http/http.dart' as http;
import '../../models.dart';

class WishListRepositoryImp extends WishListRepository {
  String endPoint = '${baseURL}wishlists';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  String? token;
  bool state = true;

  @override
  Future<ApiResponse<List<WishListModel>>?> fetchWishLists(
      {int? page, int? limit}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final studentId = await AuthenLocalDataSource.getStudentId();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      http.Response response = await http.get(
          Uri.parse(
              '$endPoint?studentIds=$studentId&state=$state&sort=$sort&page=1&limit=100'),
          headers: headers);
      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<WishListModel>> apiResponse =
            ApiResponse<List<WishListModel>>.fromJson(result,
                (data) => data.map((e) => WishListModel.fromJson(e)).toList());
        return apiResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<WishListModel?> postWishList(
      {required String studentId,
      required String brandId,
      required String description,
      required bool state}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      Map body = {
        'studentId': studentId,
        'brandId': brandId,
        'description': "Được yêu thích",
        'state': state
      };
      http.Request req = http.Request(
        'Post',
        Uri.parse('$endPoint'),
      );

      req.headers['Content-Type'] = 'application/json';
      req.headers['Authorization'] = 'Bearer $token';
      req.body = jsonEncode(body);
      final streamedResponse = await http.Client().send(req);
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        WishListModel wishList = WishListModel.fromJson(result);
        if (!wishList.status) {
          await AuthenLocalDataSource.saveUnsubcribeWishListId(
              wishList.brandId);
        }
        return wishList;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
