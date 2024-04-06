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

  BonusesLoaded({required this.bonuses});

  @override
  List<Object?> get props => [bonuses];
}

final class BonusesFailed extends BonusState {
  final String error;

  BonusesFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
