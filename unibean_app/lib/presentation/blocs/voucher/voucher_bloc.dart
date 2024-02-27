import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherRepository voucherRepository;
  VoucherBloc({
    required this.voucherRepository
  }) : super(VoucherInitial()) {
    on<LoadVouchers>(_onLoadVouchers);
  }
      Future<void> _onLoadVouchers(
      LoadVouchers event, Emitter<VoucherState> emit) async {
    emit(VoucherLoading());
    try {
      var apiResponse = await voucherRepository.fetchVouchers();
      emit(VouchersLoaded(vouchers: apiResponse!.result.toList()));
    } catch (e) {
      emit(VouchersFailed(error: e.toString()));
    }
  }
}
