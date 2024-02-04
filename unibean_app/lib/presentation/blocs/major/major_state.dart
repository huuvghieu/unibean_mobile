part of 'major_bloc.dart';

sealed class MajorState extends Equatable {
  const MajorState();

}

final class MajorInitial extends MajorState {
  @override
  List<Object?> get props => [];
}

final class MajorInProcess extends MajorState {
  @override
  List<Object?> get props => [];
}

final class MajorLoaded extends MajorState {
  final List<MajorModel> majors;

  MajorLoaded({required this.majors});

  @override
  List<Object?> get props => [majors];
}

final class MajorFailed extends MajorState {
  final String error;

  MajorFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
