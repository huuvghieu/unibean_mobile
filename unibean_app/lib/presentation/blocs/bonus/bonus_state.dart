part of 'bonus_bloc.dart';

sealed class BonusState extends Equatable {
  const BonusState();
}

final class BonusInitial extends BonusState {
  @override
  List<Object?> get props => [];
}

final class BonusLoading extends BonusState {
  @override
  List<Object?> get props => [];
}

final class BonusesLoaded extends BonusState {
  final List<BonusModel> bonuses;
  final bool hasReachedMax;

  BonusesLoaded({required this.bonuses, this.hasReachedMax = false});

  @override
  List<Object?> get props => [bonuses, hasReachedMax];
}

final class BonusesFailed extends BonusState {
  final String error;

  BonusesFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

final class BonusByIdLoading extends BonusState {
  @override
  List<Object?> get props => [];
}

final class BonusByIdLoaded extends BonusState {
  final BonusDetailModel bonusDetailModel;

  BonusByIdLoaded({required this.bonusDetailModel});

  @override
  List<Object?> get props => [bonusDetailModel];
}
