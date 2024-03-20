part of 'student_bloc.dart';

sealed class StudentState extends Equatable {
  const StudentState();
}

final class StudentInitial extends StudentState {
  @override
  List<Object?> get props => [];
}

final class StudentVoucherLoading extends StudentState {
  @override
  List<Object?> get props => [];
}

final class StudentVouchersLoaded extends StudentState {
  final List<VoucherStudentModel> voucherModels;

  StudentVouchersLoaded({required this.voucherModels});

  @override
  List<Object?> get props => [voucherModels];
}

final class StudentFaled extends StudentState {
  final String error;

  StudentFaled({required this.error});

  @override
  List<Object?> get props => [error];
}

final class StudentTransactionLoading extends StudentState {
  @override
  List<Object?> get props => [];
}

final class StudentTransactionsLoaded extends StudentState {
  final List<TransactionModel> transactions;

  StudentTransactionsLoaded({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

final class StudentOrderLoading extends StudentState {
  @override
  List<Object?> get props => [];
}

final class StudentOrdersLoaded extends StudentState {
  final List<OrderModel> orderModels;

  StudentOrdersLoaded({required this.orderModels});

  @override
  List<Object?> get props => [orderModels];
}
