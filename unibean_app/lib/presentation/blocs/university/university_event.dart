part of 'university_bloc.dart';

sealed class UniversityEvent extends Equatable {
  const UniversityEvent();
}

final class LoadUniversities extends UniversityEvent{
  @override
  List<Object?> get props => [];
}

// class FetchAllUniversities extends UniversityEvent{
//   @override
//   List<Object?> get props => throw UnimplementedError();

// }