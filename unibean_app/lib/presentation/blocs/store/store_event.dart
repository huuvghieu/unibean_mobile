part of 'store_bloc.dart';

sealed class StoreEvent extends Equatable {
  const StoreEvent();
}

final class LoadStoreTransactions extends StoreEvent {
  final int page;
  final int limit;
  final String id;
  final int typeIds;
  LoadStoreTransactions(
      {this.page = 1, this.limit = 10, required this.id, this.typeIds = 0});

  @override
  List<Object?> get props => [page, limit, id, typeIds];
}

final class LoadMoreTransactionStore extends StoreEvent {
  final int page;
  final int limit;
  final int typeIds;
  final ScrollController scrollController;

  LoadMoreTransactionStore(this.scrollController,
      {this.page = 1, this.limit = 10, this.typeIds = 0});
  @override
  List<Object?> get props => [page, limit, typeIds, scrollController];
}

final class LoadStoreCampaignVouchers extends StoreEvent {
  final int page;
  final int limit;

  LoadStoreCampaignVouchers({this.page = 1, this.limit = 10});

  @override
  List<Object?> get props => [page, limit];
}

final class ScanVoucherCode extends StoreEvent {
  final String storeId;
  final String voucherCode;
  final String description;
  final bool state;

  ScanVoucherCode(
      {required this.storeId,
      required this.voucherCode,
      required this.description,
      required this.state});

  @override
  List<Object?> get props => [storeId, voucherCode, description, state];
}

final class CreateBonus extends StoreEvent {
  final String storeId;
  final String studentId;
  final double amount;
  final String description;
  final bool state;

  CreateBonus(
      {required this.storeId,
      required this.studentId,
      required this.amount,
      required this.description,
      required this.state});

  @override
  List<Object?> get props => [storeId, studentId, amount, description, state];
}
