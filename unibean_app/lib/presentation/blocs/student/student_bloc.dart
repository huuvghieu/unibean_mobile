import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository studentRepository;
  StudentBloc({required this.studentRepository}) : super(StudentInitial()) {
    on<LoadStudentVouchers>(_onLoadStudentVoucher);
    on<LoadStudentTransactions>(_onLoadStudentTransaction);
  }

  Future<void> _onLoadStudentVoucher(
      LoadStudentVouchers event, Emitter<StudentState> emit) async {
    emit(StudentVoucherLoading());
    try {
      var apiResponse = await studentRepository
          .fetchVoucherStudentId(event.page, event.limit, id: event.id);
      emit(StudentVouchersLoaded(voucherModels: apiResponse!.result));
    } catch (e) {
      emit(StudentFaled(error: e.toString()));
    }
  }

  Future<void> _onLoadStudentTransaction(
      LoadStudentTransactions event, Emitter<StudentState> emit) async {
    emit(StudentTransactionLoading());
    try {
      var apiResponse = await studentRepository
          .fetchTransactionsStudentId(event.page, event.limit, id: event.id);
      emit(StudentTransactionsLoaded(transactions: apiResponse!.result));
    } catch (e) {
      emit(StudentFaled(error: e.toString()));
    }
  }
}
