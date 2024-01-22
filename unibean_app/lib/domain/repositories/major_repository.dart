import 'package:unibean_app/data/models.dart';

abstract class MajorRepository {
  const MajorRepository();

  Future<ApiResponse<List<MajorModel>>?> fetchMajors({int? page});
}