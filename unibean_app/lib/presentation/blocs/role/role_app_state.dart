part of 'role_app_bloc.dart';

sealed class RoleAppState extends Equatable {
  const RoleAppState();
}

final class Verified extends RoleAppState {
  final AuthenModel authenModel;
  final StudentModel studentModel;

  Verified({required this.authenModel, required this.studentModel});
  @override
  List<Object?> get props => [authenModel, studentModel];
}

final class Pending extends RoleAppState {
  final AuthenModel authenModel;
  final StudentModel studentModel;

  Pending({required this.authenModel, required this.studentModel});
  @override
  List<Object?> get props => [authenModel, studentModel];
}

final class Rejected extends RoleAppState {
  final AuthenModel authenModel;
  final StudentModel studentModel;

  Rejected({required this.authenModel, required this.studentModel});
  @override
  List<Object?> get props => [authenModel, studentModel];
}

final class Unverified extends RoleAppState {
  final AuthenModel authenModel;

  Unverified({required this.authenModel});
  @override
  List<Object?> get props => [authenModel];
}

final class StoreRole extends RoleAppState {
  final AuthenModel authenModel;
  final StoreModel storeModel;

  StoreRole({required this.authenModel, required this.storeModel});


  @override
  List<Object?> get props => [authenModel, storeModel];
}

final class RoleAppLoading extends RoleAppState {
  @override
  List<Object?> get props => [];
}
