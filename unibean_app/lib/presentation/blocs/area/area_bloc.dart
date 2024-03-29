import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models.dart';
import '../../../domain/repositories.dart';

part 'area_event.dart';
part 'area_state.dart';

class AreaBloc extends Bloc<AreaEvent, AreaState> {
  final AreaRepository areaRepository;

  AreaBloc({required this.areaRepository}) : super(AreaInitial()) {
    on<LoadAreas>(_onLoadArea);
  }

    Future<void> _onLoadArea(
      LoadAreas event, Emitter<AreaState> emit) async {
    emit(AreaLoading());
    try {
      var apiResponse = await areaRepository.fetchArea();
      emit(AreaLoaded(areas: apiResponse!.result.toList()));
    } catch (e) {
      emit(AreaFailed(error: e.toString()));
    }
  }
}
