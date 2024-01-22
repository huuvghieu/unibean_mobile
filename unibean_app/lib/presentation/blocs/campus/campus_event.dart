part of 'campus_bloc.dart';

sealed class CampusEvent extends Equatable {
  const CampusEvent();
}

final class LoadCampus extends CampusEvent {
  final String universityId;

  LoadCampus({required this.universityId});


  @override
  List<Object?> get props => [universityId];
}
