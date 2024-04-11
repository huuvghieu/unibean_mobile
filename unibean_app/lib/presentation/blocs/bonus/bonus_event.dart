part of 'bonus_bloc.dart';

sealed class BonusEvent extends Equatable {
  const BonusEvent();
}

final class LoadBonus extends BonusEvent {
  final int page;
  final int limit;

  LoadBonus({this.page = 1, this.limit = 10});

  @override
  List<Object> get props => [page, limit];
}

final class LoadMoreBonuses extends BonusEvent {
  final int page;
  final int limit;

  LoadMoreBonuses({this.page = 1, this.limit = 10});

  @override
  List<Object> get props => [page, limit];
}

final class LoadBonusDetail extends BonusEvent {
  final String bonusId;

  LoadBonusDetail({required this.bonusId});

  @override
  List<Object> get props => [bonusId];
}
