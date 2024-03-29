part of 'area_bloc.dart';

sealed class AreaState extends Equatable {
  const AreaState();
}

final class AreaInitial extends AreaState {
  @override
  List<Object> get props => [];
}

final class AreaLoading extends AreaState {
  @override
  List<Object?> get props => [];
}

final class AreaLoaded extends AreaState {
  final List<AreaModel> areas;

  AreaLoaded({required this.areas});

  @override
  List<Object?> get props => [areas];
}

final class AreaFailed extends AreaState {
  final String error;

  AreaFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
