part of 'station_bloc.dart';

sealed class StationEvent extends Equatable {
  const StationEvent();
}
final class LoadStations extends StationEvent {
  final int page;
  final int limit;

  LoadStations({this.page = 1, this.limit = 100});
  @override
  List<Object?> get props => [page, limit];
}
