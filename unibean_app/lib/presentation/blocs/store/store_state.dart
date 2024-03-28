part of 'store_bloc.dart';

sealed class StoreState extends Equatable {
  const StoreState();
}

final class StoreInitial extends StoreState {
  @override
  List<Object> get props => [];
}

final class StoreTransactionLoading extends StoreState {
  @override
  List<Object?> get props => [];
}

final class StoreTransactionsLoaded extends StoreState {
  final List<TransactionStoreModel>? transactions;
  final List<TransactionStoreModel>? activityTransactions;
  final List<TransactionStoreModel>? bonusTransactions;
  final bool hasReachedMax;

  StoreTransactionsLoaded(
      this.transactions, this.activityTransactions, this.bonusTransactions,
      {this.hasReachedMax = false});

  @override
  List<Object?> get props =>
      [transactions, activityTransactions, bonusTransactions, hasReachedMax];
}

final class StoreFailed extends StoreState {
  final String error;

  StoreFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

final class StoreCampaignVoucherLoading extends StoreState {
  @override
  List<Object?> get props => [];
}

final class StoreCampaignVoucherLoaded extends StoreState {
  final CampaignStoreCartModel campaignStoreCart;
  // final bool hasReach

  StoreCampaignVoucherLoaded({required this.campaignStoreCart});

  @override
  List<Object?> get props => [campaignStoreCart];
}

final class ScanVoucherSuccess extends StoreState {
  final String result;

  ScanVoucherSuccess({required this.result});

  @override
  List<Object?> get props => [result];
}

final class ScanVoucherLoading extends StoreState {
  @override
  List<Object?> get props => [];
}

final class ScanVoucherFailed extends StoreState {
  final String error;

  ScanVoucherFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

final class CreateBonusLoading extends StoreState {
  @override
  List<Object?> get props => [];
}

final class CreateBonusSucess extends StoreState {
   final TransactResultModel transactModel;

  CreateBonusSucess({required this.transactModel});

  @override
  List<Object?> get props => [];
}

final class CreateBonusFailed extends StoreState {
  final String error;

  CreateBonusFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
