part of 'area_bloc.dart';

sealed class AreaEvent extends Equatable {
  const AreaEvent();
}

final class LoadAreas extends AreaEvent{
  @override
  List<Object?> get props => [];
}
