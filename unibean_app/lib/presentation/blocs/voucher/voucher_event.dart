part of 'voucher_bloc.dart';

sealed class VoucherEvent extends Equatable {
  const VoucherEvent();
}
final class LoadVouchers extends VoucherEvent {
  @override
  List<Object?> get props => [];
}