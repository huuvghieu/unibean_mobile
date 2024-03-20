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
  LoadStudentTransactions({this.page = 1, this.limit = 10, required this.id});

  @override
  List<Object?> get props => [page, limit, id];
}

final class LoadStudentOrders extends StudentEvent {
  final int page;
  final int limit;
  final String id;
  LoadStudentOrders({this.page = 1, this.limit = 10, required this.id});

  @override
  List<Object?> get props => [page, limit, id];
}

