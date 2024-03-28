import '../../../data/models.dart';

abstract class StoreRepository {
  const StoreRepository();

  Future<StoreModel?> fetchStoreById({required String storeId});

  Future<ApiResponse<List<TransactionStoreModel>>?> fetchTransactionsStoreId(
      int? page, int? limit, int? typeIds,
      {required String id});

  Future<ApiResponse<List<CampaignVoucherStoreModel>>?>
      fetchCampaignVoucherStoreId(
    int? page,
    int? limit,
  );

  Future<Map<bool, String>> postScanVoucherCode(
      {required String storeId,
      required String voucherCode,
      required String description,
      required bool state});

  Future<List<CampaignRankingModel>?> fecthCampaignRanking();

  Future<TransactResultModel?> createBonus({
    required String storeId,
    required String studentId,
    required double amount,
    required String description,
    required bool state,
  });
}
