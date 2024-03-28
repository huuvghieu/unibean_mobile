part of 'student_bloc.dart';

sealed class StudentEvent extends Equatable {
  const StudentEvent();
}

final class LoadStudentVouchers extends StudentEvent {
  final int page;
  final int limit;
  final String id;
  LoadStudentVouchers({this.page = 1, this.limit = 10, required this.id});

  @override
  List<Object?> get props => [page, limit, id];
}

final class LoadStudentTransactions extends StudentEvent {
  final int page;
  final int limit;
  final String id;
  final int typeIds;
  LoadStudentTransactions(
      {this.page = 1, this.limit = 10, required this.id, this.typeIds = 0});

  @override
  List<Object?> get props => [page, limit, id, typeIds];
}

final class LoadMoreTransactions extends StudentEvent {
  final int page;
  final int limit;
  final int typeIds;

  LoadMoreTransactions({this.page = 1, this.limit = 10, this.typeIds = 0});
  @override
  List<Object?> get props => [page, limit, typeIds];
}

final class LoadStudentOrders extends StudentEvent {
  final int page;
  final int limit;
  final String id;
  LoadStudentOrders({this.page = 1, this.limit = 10, required this.id});

  @override
  List<Object?> get props => [page, limit, id];
}

final class UpdateStudent extends StudentEvent {
  final String studentId;
  final String fullName;
  final String majorId;
  final String campusId;
  final int gender;
  final String avatar;
  final String address;

  UpdateStudent(
      {required this.studentId,
      required this.fullName,
      required this.majorId,
      required this.campusId,
      required this.gender,
      this.avatar = '',
      this.address = ''});

  @override
  List<Object?> get props =>
      [studentId, fullName, majorId, campusId, gender, address];
}

final class LoadVoucherItem extends StudentEvent {
  final String studentId;
  final String voucherId;

  LoadVoucherItem({required this.studentId, required this.voucherId});

  @override
  List<Object?> get props => [studentId, voucherId];
}

final class LoadStudentById extends StudentEvent {
  final String studentId;

  LoadStudentById({required this.studentId});
  
  @override
  List<Object?> get props => [studentId];
  
}
