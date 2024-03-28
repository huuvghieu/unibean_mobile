import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';
part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository studentRepository;

  StudentBloc({required this.studentRepository}) : super(StudentInitial()) {
    scrollTransactionController.addListener(() {
      add(LoadMoreTransactions());
    });
    on<LoadStudentVouchers>(_onLoadStudentVouchers);
    on<LoadStudentTransactions>(_onLoadStudentTransactions);
    on<LoadStudentOrders>(_onLoadStudentOrder);
    on<LoadMoreTransactions>(_onLoadMoreTransactions);
    on<LoadVoucherItem>(_onLoadvoucherItem);
    on<UpdateStudent>(_onUpdateStudent);
    on<LoadStudentById>(_onLoadStudentById);
  }

  ScrollController scrollTransactionController = ScrollController();
  var isLoadingMore = false;
  int pageTransaction = 1;

//--------------------
  Future<void> _onLoadStudentVouchers(
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

  Future<void> _onLoadStudentTransactions(
      LoadStudentTransactions event, Emitter<StudentState> emit) async {
    emit(StudentTransactionLoading());
    try {
      var apiResponse = await studentRepository.fetchTransactionsStudentId(
          event.page, event.limit, event.typeIds,
          id: event.id);
      emit(StudentTransactionsLoaded(transactions: apiResponse!.result));
    } catch (e) {
      emit(StudentFaled(error: e.toString()));
    }
  }

  Future<void> _onLoadMoreTransactions(
      LoadMoreTransactions event, Emitter<StudentState> emit) async {
    try {
      final studentId = await AuthenLocalDataSource.getStudentId();
      if (scrollTransactionController.position.pixels ==
          scrollTransactionController.position.maxScrollExtent) {
        isLoadingMore = true;
        pageTransaction++;
        var apiResponse = await studentRepository.fetchTransactionsStudentId(
            pageTransaction, event.limit, event.typeIds,
            id: studentId!);
        if (apiResponse!.result.length == 0) {
          emit(StudentTransactionsLoaded(
              transactions: List.from(
                  (this.state as StudentTransactionsLoaded).transactions)
                ..addAll(apiResponse.result),
              hasReachedMax: true));
          print(state);
        } else {
          emit(StudentTransactionsLoaded(
              transactions: List.from(
                  (this.state as StudentTransactionsLoaded).transactions)
                ..addAll(apiResponse.result)));
        }
      }
    } catch (e) {
      emit(StudentFaled(error: e.toString()));
    }
  }

  Future<void> _onLoadStudentOrder(
      LoadStudentOrders event, Emitter<StudentState> emit) async {
    emit(StudentOrderLoading());
    try {
      var apiResponse = await studentRepository
          .fetchOrdersStudentId(event.page, event.limit, id: event.id);
      emit(StudentOrdersLoaded(orderModels: apiResponse!.result));
    } catch (e) {
      emit(StudentFaled(error: e.toString()));
    }
  }

  Future<void> _onUpdateStudent(
      UpdateStudent event, Emitter<StudentState> emit) async {
    emit(StudentUpding());
    try {
      var studentModel = await studentRepository.putStudent(
          studentId: event.studentId,
          fullName: event.fullName,
          majorId: event.majorId,
          campusId: event.campusId,
          gender: event.gender,
          address: event.address,
          avatar: event.avatar);
      if (studentModel == null) {
        emit(StudentFaled(error: 'Sửa thất bại!'));
      } else {
        emit(StudentUpdateSuccess(studentModel: studentModel));
      }
    } catch (e) {
      emit(StudentFaled(error: e.toString()));
    }
  }

  Future<void> _onLoadvoucherItem(
      LoadVoucherItem event, Emitter<StudentState> emit) async {
    emit(StudentVoucherItemLoading());
    try {
      var apiResponse = await studentRepository.fetchVoucherItemByStudentId(
          studentId: event.studentId, voucherId: event.voucherId);
      emit(StudentVoucherItemLoaded(voucherStudentItemModel: apiResponse!));
    } catch (e) {
      emit(StudentFaled(error: e.toString()));
    }
  }

    Future<void> _onLoadStudentById(
      LoadStudentById event, Emitter<StudentState> emit) async {
    emit(StudentByIdLoading());
    try {
      var apiResponse = await studentRepository.fetchStudentById(
          id: event.studentId);
      emit(StudentByIdSuccess(studentMode: apiResponse!));
    } catch (e) {
      emit(StudentByIdFailed(error: e.toString()));
    }
  }
}
