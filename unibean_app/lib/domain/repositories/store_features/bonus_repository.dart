import 'package:unibean_app/data/models.dart';

abstract class BonusRepository {
  const BonusRepository();

  Future<ApiResponse<List<BonusModel>>?> fecthBonuses({int? page, int? limit});
  Future<BonusDetailModel?> fetchBonus({required String bonusId});

}
