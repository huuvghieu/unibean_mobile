import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';

part 'major_event.dart';
part 'major_state.dart';

class MajorBloc extends Bloc<MajorEvent, MajorState> {
  final MajorRepository majorRepository;

  MajorBloc({required this.majorRepository}) : super(MajorInitial()) {
    on<LoadMajor>(_onLoadMajors);
  }

  Future<void> _onLoadMajors(LoadMajor event, Emitter<MajorState> emit) async {
    emit(MajorLoading());
    try {
      var apiResponse = await majorRepository.fetchMajors();
      emit(MajorLoaded(majors: apiResponse!.result.toList()));
    } catch (e) {
      emit(MajorFailed(error: e.toString()));
    }
  }
}
