import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/models/student_features/university_model.dart';
import 'package:unibean_app/domain/repositories.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final UniversityRepository universityRepository;

  UniversityBloc({required this.universityRepository})
      : super(UniversityInitial()) {
    on<LoadUniversities>(_onLoadUniversity);
  }

  Future<void> _onLoadUniversity(
      LoadUniversities event, Emitter<UniversityState> emit) async {
    emit(UniversityLoading());
    try {
      var apiResponse = await universityRepository.fetchUnversities();
      emit(UniversityLoaded(universities: apiResponse!.result.toList()));
    } catch (e) {
      emit(UniversityFailed(error: e.toString()));
    }
  }
}
