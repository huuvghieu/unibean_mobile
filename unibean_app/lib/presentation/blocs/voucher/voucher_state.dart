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

  VouchersLoaded({required this.vouchers});
  @override
  List<Object?> get props => [vouchers];
}

final class VouchersFailed extends VoucherState {
  final String error;

  VouchersFailed({required this.error});
  @override
  List<Object?> get props => [error];
}