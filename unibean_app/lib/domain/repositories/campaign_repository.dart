import 'package:unibean_app/data/models.dart';

abstract class CampaignRepository {
  const CampaignRepository();

  Future<ApiResponse<List<CampaignModel>>?> fecthCampaigns(
      {int? page, int? limit});

  Future<CampaignDetailModel?> fecthCampaignById({required String id});

  Future<ApiResponse<List<CampaignStoreModel>>?> fecthCampaignStoreById(
      int? page, int? limit,
      {required String id});

  Future<ApiResponse<List<CampaignVoucherModel>>?> fecthCampaignVouchersById(
      int? page, int? limit,
      {required String id});

  Future<CampaignVoucherDetailModel?> fecthCampaignVoucherDetailById(
      {required String campaignId, required String campaignVoucherId});

  Future<String?> redeemCampaignVoucher(
      {required String campaignId,
      required String campaignVoucherId,
      required String studentId,
      required int quantity,
      required String description});
}
