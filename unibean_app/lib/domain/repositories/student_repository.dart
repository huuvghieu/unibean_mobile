import '../../data/models.dart';

abstract class StudentRepository {
  const StudentRepository();
  Future<StudentModel?> fetchStudentById({required String id});

  Future<ApiResponse<List<VoucherStudentModel>>?> fetchVoucherStudentId(
      {required String id});
}
