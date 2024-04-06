import 'dart:convert';

import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/api_response.dart';
import 'package:unibean_app/data/models/student_features/product_detail_model.dart';
import 'package:unibean_app/data/models/student_features/product_model.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/config/constants.dart';

class ProductRepositoryImp extends ProductRepository {
  String endPoint = '${baseURL}products';
  String sort = 'Id%2Cdesc';
  int page = 1;
  int limit = 10;
  bool state = true;
  String? token;
  @override
  Future<ApiResponse<List<ProductModel>>?> fetchProducts(
      {int? page, int? limit, String? search}) async {
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
      if (search != null) {
        http.Response response = await http.get(
            Uri.parse(
                '$endPoint?state=$state&sort=$sort&search=$search&page=$page&limit=$limit'),
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
      } else if (search == null || search == '') {
        http.Response response = await http.get(
            Uri.parse('$endPoint?state=$state&sort=$sort&page=$page&limit=$limit'),
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
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  @override
  Future<ProductDetailModel?> fecthProductById(
      {required String productId}) async {
    try {
      token = await AuthenLocalDataSource.getToken();
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endPoint/$productId'), headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        final productDetail = ProductDetailModel.fromJson(result);
        return productDetail;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
