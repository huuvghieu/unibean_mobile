part of 'station_bloc.dart';

sealed class StationState extends Equatable {
  const StationState();
}

final class StationInitial extends StationState {
  @override
  List<Object?> get props => [];
}

final class StationLoading extends StationState {
  @override
  List<Object?> get props => [];
}

final class StationsLoaded extends StationState {
  final List<StationModel> stations;
  final bool hasReachedMax;

  StationsLoaded({required this.stations, this.hasReachedMax = false});
  @override
  List<Object?> get props => [stations, hasReachedMax];
}

final class StationsFailed extends StationState {
  final String error;

  StationsFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
