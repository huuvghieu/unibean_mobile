import '../../../data/models.dart';

abstract class StoreRepository {
  const StoreRepository();

  Future<StoreModel?> fetchStoreById({required String storeId});

  Future<ApiResponse<List<TransactionStoreModel>>?> fetchTransactionsStoreId(
      int? page, int? limit, int? typeIds,
      {required String id});

  Future<ApiResponse<List<CampaignVoucherStoreModel>>?>
      fetchCampaignVoucherStoreId(int? page, int? limit, String? search);

  Future<Map<bool, String>> postScanVoucherCode(
      {required String storeId,
      required String voucherCode,
      required String description,
      required bool state});

  Future<List<CampaignRankingModel>?> fecthCampaignRanking();
  Future<List<StudentRankingModel>?> fecthStudentRanking();

  Future<TransactResultModel?> createBonus({
    required String storeId,
    required String studentId,
    required double amount,
    required String description,
    required bool state,
  });

  Future<CampaignVoucherDetailModel?> fetchCampaignVoucherDetail(
      {required String storeId, required String campaignVoucherDetailId});

  Future<StoreModel?> updateStore(
      {required String areaId,
      required String storeName,
      required String address,
      required String avatar,
      required String openHours,
      required String closeHours,
      required String description,
      required String storeId,
      required bool state});
}
