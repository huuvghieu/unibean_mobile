import 'package:unibean_app/data/models.dart';

abstract class ChallengeRepository {
  const ChallengeRepository();

  Future<ApiResponse<List<ChallengeModel>>?> fecthChallenges({int? page, int? limit});
}
