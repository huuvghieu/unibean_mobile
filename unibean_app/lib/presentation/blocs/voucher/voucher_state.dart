part of 'voucher_bloc.dart';

sealed class VoucherState extends Equatable {
  const VoucherState();
}

final class VoucherInitial extends VoucherState {
  @override
  List<Object?> get props => [];
}

final class VoucherLoading extends VoucherState {
  @override
  List<Object?> get props => [];
}

final class VouchersLoaded extends VoucherState {
  final List<VoucherModel> vouchers;
  final bool hasReachedMax;

  VouchersLoaded({required this.vouchers, this.hasReachedMax = false});
  @override
  List<Object?> get props => [vouchers, hasReachedMax];
}

final class VouchersFailed extends VoucherState {
  final String error;

  VouchersFailed({required this.error});
  @override
  List<Object?> get props => [error];
}

final class VoucherByIdLoading extends VoucherState {
  @override
  List<Object?> get props => [];
}

final class VoucherByIdLoaded extends VoucherState {
  final VoucherDetailModel voucherDetailModel;

  VoucherByIdLoaded({required this.voucherDetailModel});
  @override
  List<Object?> get props => [voucherDetailModel];
}
