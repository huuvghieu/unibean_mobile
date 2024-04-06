part of 'bonus_bloc.dart';

sealed class BonusEvent extends Equatable {
  const BonusEvent();
}

final class LoadBonus extends BonusEvent {
  final int page;
  final int limit;

  LoadBonus({this.page = 1, this.limit = 10});

  @override
  List<Object> get props => [];
}
