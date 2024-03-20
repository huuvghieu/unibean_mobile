import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final StationRepository stationRepository;
  StationBloc({required this.stationRepository}) : super(StationInitial()) {
    on<LoadStations>(_onLoadStations);
  }


    Future<void> _onLoadStations(
      LoadStations event, Emitter<StationState> emit) async {
    emit(StationLoading());
    try {
      var apiResponse = await stationRepository.fetchStation(
          page: event.page, limit: event.limit);
      emit(StationsLoaded(stations: apiResponse!.result.toList()));
    } catch (e) {
      emit(StationsFailed(error: e.toString()));
    }
  }
}
