import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/models/student_features/campus_model.dart';
import 'package:unibean_app/domain/repositories.dart';

part 'campus_event.dart';
part 'campus_state.dart';

class CampusBloc extends Bloc<CampusEvent, CampusState> {
  final CampusRepository campusRepository;

  CampusBloc(this.campusRepository) : super(CampusLoading()) {
    on<LoadCampus>(_onLoadCampusByUniversityId);
  }

  Future<void> _onLoadCampusByUniversityId(
      LoadCampus event, Emitter<CampusState> emit) async {
    emit(CampusLoading());
    try {
      var apiResponse =
          await campusRepository.fetchCampusByUniId(uniId: event.universityId);
      emit(CampusLoaded(campuses: apiResponse!.result.toList()));
    } catch (e) {
      emit(CampusFailed(error: e.toString()));
    }
  }
}
