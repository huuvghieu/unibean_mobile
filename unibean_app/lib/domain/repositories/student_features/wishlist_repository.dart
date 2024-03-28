import 'package:unibean_app/data/models.dart';

abstract class WishListRepository {
  const WishListRepository();

  Future<ApiResponse<List<WishListModel>>?> fetchWishLists(
      {int? page, int? limit});

  Future<String?> postWishList();
}
