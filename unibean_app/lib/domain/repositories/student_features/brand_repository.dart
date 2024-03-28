import 'package:unibean_app/data/models.dart';

abstract class BrandRepository {
  const BrandRepository();

  Future<ApiResponse<List<BrandModel>>?> fecthBrands({int? page, int? limit});

  Future<BrandModel?> fecthBrandById({required String id});

  Future<ApiResponse<List<VoucherModel>>?> fecthVouchersByBrandId(
      int? page, int? limit,
      {required String id});

  Future<ApiResponse<List<CampaignModel>>?> fecthCampaignssByBrandId(
      int? page, int? limit,
      {required String id});
}
