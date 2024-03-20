import '../../data/models.dart';

abstract class StudentRepository {
  const StudentRepository();
  Future<StudentModel?> fetchStudentById({required String id});

  Future<ApiResponse<List<VoucherStudentModel>>?> fetchVoucherStudentId(
      int? page, int? limit,
      {required String id});

  Future<ApiResponse<List<TransactionModel>>?> fetchTransactionsStudentId(
      int? page, int? limit,
      {required String id});

  Future<ApiResponse<List<OrderModel>>?> fetchOrdersStudentId(
      int? page, int? limit,
      {required String id});

  Future<bool?> postChallengeStudentId({
    required String studentId,
    required String challengeId,
  });
}
