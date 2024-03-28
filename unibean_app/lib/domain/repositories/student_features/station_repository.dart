import 'package:unibean_app/data/models.dart';

abstract class StationRepository {
  const StationRepository();

  Future<ApiResponse<List<StationModel>>?> fetchStation(
      {int? page, int? limit});
}
