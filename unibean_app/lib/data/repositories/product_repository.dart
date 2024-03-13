import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/product_model.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:http/http.dart' as http;

import '../../presentation/config/constants.dart';

class ProductRepositoryImp extends ProductRepository {
  String endPoint = '${baseURL}products';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  String? token;
  @override
  Future<ApiResponse<List<ProductModel>>?> fetchProducts(
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
      if (limit == null) {
        limit = this.limit;
      }

      http.Response response = await http.get(
          Uri.parse(
              '$endPoint?sort=$sort&page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        ApiResponse<List<ProductModel>> apiResponse =
            ApiResponse<List<ProductModel>>.fromJson(result,
                (data) => data.map((e) => ProductModel.fromJson(e)).toList());
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
