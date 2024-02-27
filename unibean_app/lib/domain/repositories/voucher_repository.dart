import 'package:unibean_app/data/models.dart';

abstract class VoucherRepository {
  const VoucherRepository();

  Future<ApiResponse<List<VoucherModel>>?> fetchVouchers({int? page});
}
