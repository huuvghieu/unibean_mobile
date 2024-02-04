part of 'major_bloc.dart';

sealed class MajorEvent extends Equatable {
  const MajorEvent();

}
final class LoadMajor extends MajorEvent{
  @override
  List<Object?> get props => [];
}