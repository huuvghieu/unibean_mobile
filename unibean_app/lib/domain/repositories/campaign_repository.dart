import 'package:unibean_app/data/models.dart';

abstract class CampaignRepository {
  const CampaignRepository();

  Future<ApiResponse<List<CampaignModel>>?> fecthCampaigns({int? page, int? limit});
}
