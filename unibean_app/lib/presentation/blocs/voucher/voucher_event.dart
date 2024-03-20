part of 'voucher_bloc.dart';

sealed class VoucherEvent extends Equatable {
  const VoucherEvent();
}

final class LoadVouchers extends VoucherEvent {
  final int page;
  final int limit;

  LoadVouchers({this.page = 1, this.limit = 2});
  @override
  List<Object?> get props => [page, limit];
}

final class LoadMoreVouchers extends VoucherEvent {
  final int page;
  final int limit;

  LoadMoreVouchers({this.page = 1, this.limit = 2});
  @override
  List<Object?> get props => [page, limit];
}

final class LoadVoucherById extends VoucherEvent {
  final String voucherId;

  LoadVoucherById({required this.voucherId});

  @override
  List<Object?> get props => [voucherId];
}
