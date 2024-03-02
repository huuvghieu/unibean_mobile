part of 'role_app_bloc.dart';

sealed class RoleAppState extends Equatable {
  const RoleAppState();
}

final class RoleAppUnknown extends RoleAppState {
  @override
  List<Object?> get props => [];
}

final class RoleAppStudentVerified extends RoleAppState {
  final AuthenModel authenModel;
  final StudentModel studentModel;

  RoleAppStudentVerified(
      {required this.authenModel, required this.studentModel});
  @override
  List<Object?> get props => [authenModel, studentModel];
}

final class RoleAppStudentUnverified extends RoleAppState {
  final AuthenModel authenModel;

  RoleAppStudentUnverified(
      {required this.authenModel});
  @override
  List<Object?> get props => [authenModel];
}

final class RoleAppStore extends RoleAppState {
  @override
  List<Object?> get props => [];
}

final class RoleAppLoading extends RoleAppState {
  @override
  List<Object?> get props => [];
}
