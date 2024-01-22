part of 'university_bloc.dart';

sealed class UniversityState extends Equatable {
  const UniversityState();
}

final class UniversityInitial extends UniversityState {
  @override
  List<Object?> get props => [];
}

final class UniversityInProcess extends UniversityState {
  @override
  List<Object?> get props => [];
}

final class UniversityLoaded extends UniversityState {
  final List<UniversityModel> universities;

  UniversityLoaded({required this.universities});

  @override
  List<Object?> get props => [universities];
}

final class UniversityFailed extends UniversityState {
  final String error;

  UniversityFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
