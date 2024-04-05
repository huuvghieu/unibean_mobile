import 'package:unibean_app/data/models.dart';

abstract class WishListRepository {
  const WishListRepository();

  Future<ApiResponse<List<WishListModel>>?> fetchWishLists(
      {int? page, int? limit});

  Future<WishListModel?> postWishList(
      {required String studentId,
      required String brandId,
      required String description,
      required bool state});
}
