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

  RoleAppStudentVerified({required this.authenModel});
  @override
  List<Object?> get props => [authenModel];
}

final class RoleAppStudentUnverified extends RoleAppState {
  @override
  List<Object?> get props => [];
}

final class RoleAppStore extends RoleAppState {
  @override
  List<Object?> get props => [];
}

final class RoleAppLoading extends RoleAppState {
  @override
  List<Object?> get props => [];
}