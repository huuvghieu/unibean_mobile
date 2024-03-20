import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherRepository voucherRepository;
  ScrollController scrollController = ScrollController();
  var isLoadingMore = false;
  int page = 1;

  VoucherBloc({required this.voucherRepository}) : super(VoucherInitial()) {
    scrollController.addListener(
      () {
        add(LoadMoreVouchers());
      },
    );
    on<LoadVouchers>(_onLoadVouchers);
    on<LoadMoreVouchers>(_onLoadMoreVouchers);
    on<LoadVoucherById>(_onLoadVoucherById);
  }

  //----------------
  Future<void> _onLoadVouchers(
      LoadVouchers event, Emitter<VoucherState> emit) async {
    emit(VoucherLoading());
    try {
      var apiResponse = await voucherRepository.fetchVouchers(
          page: event.page, limit: event.limit);
      emit(VouchersLoaded(vouchers: apiResponse!.result.toList()));
    } catch (e) {
      emit(VouchersFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadMoreVouchers(
      LoadMoreVouchers event, Emitter<VoucherState> emit) async {
    try {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoadingMore = true;
        page++;
        var apiResponse = await voucherRepository.fetchVouchers(
            page: page, limit: event.limit);
        if (apiResponse!.result.length == 0) {
          emit(VouchersLoaded(
              vouchers: List.from((this.state as VouchersLoaded).vouchers)
                ..addAll(apiResponse.result),
              hasReachedMax: true));
          print(state);
        } else {
          emit(VouchersLoaded(
              vouchers: List.from((this.state as VouchersLoaded).vouchers)
                ..addAll(apiResponse.result)));
        }
      }
    } catch (e) {
      emit(VouchersFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadVoucherById(
      LoadVoucherById event, Emitter<VoucherState> emit) async {
    emit(VoucherByIdLoading());
    try {
      var voucherDetail =
          await voucherRepository.fetchVoucherById(voucherId: event.voucherId);
      emit(VoucherByIdLoaded(voucherDetailModel: voucherDetail!));
    } catch (e) {
      emit(VouchersFailed(error: e.toString()));
    }
  }
}
