import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../data/datasource/authen_local_datasource.dart';
import '../../../data/models.dart';
import '../../../domain/repositories.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository storeRepository;
  StoreBloc({required this.storeRepository}) : super(StoreInitial()) {
    on<LoadStoreCampaignVouchers>(_onLoadStoreCampaignVouchers);
    on<LoadStoreTransactions>(_onLoadStoreTransactions);
    on<LoadMoreTransactionStore>(_onLoadMoreTransactions);
    on<ScanVoucherCode>(_onScanVoucherCode);
    on<CreateBonus>(_onCreateBonus);
    on<LoadCampaignVoucherDetail>(_onLoadCampaignVoucherDetail);
    on<UpdateStore>(_onUpdateStore);
    on<LoadCampaignVoucherInformation>(_onLoadCampaignVoucherInformation);
    on<LoadStoreById>(_onLoadStoreById);
  }
  var isLoadingMore = false;
  int pageTransaction = 1;
  int pageActivityTransaction = 1;
  int pageBonusTranastion = 1;

  Future<void> _onLoadStoreTransactions(
      LoadStoreTransactions event, Emitter<StoreState> emit) async {
    emit(StoreTransactionLoading());
    try {
      var apiResponse = await storeRepository.fetchTransactionsStoreId(
          event.page, event.limit, event.typeIds,
          id: event.id);
      bool hasReachedMax = false;
      if (event.typeIds == 0) {
        if (apiResponse!.totalCount <= apiResponse.pageSize) {
          hasReachedMax = true;
        }
        emit(StoreTransactionsLoaded(
          apiResponse.result,
          null,
          null,
          hasReachedMax: hasReachedMax,
        ));
      } else if (event.typeIds == 1) {
        if (apiResponse!.totalCount <= apiResponse.pageSize) {
          hasReachedMax = true;
        }
        emit(StoreTransactionsLoaded(null, apiResponse.result, null,
            hasReachedMax: hasReachedMax));
      } else {
        if (apiResponse!.totalCount <= apiResponse.pageSize) {
          hasReachedMax = true;
        }
        emit(StoreTransactionsLoaded(null, null, apiResponse.result,
            hasReachedMax: hasReachedMax));
      }
    } catch (e) {
      emit(StoreFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadMoreTransactions(
      LoadMoreTransactionStore event, Emitter<StoreState> emit) async {
    try {
      final storeId = await AuthenLocalDataSource.getStoreId();
      if (event.scrollController.position.pixels ==
          event.scrollController.position.maxScrollExtent) {
        if ((this.state as StoreTransactionsLoaded).hasReachedMax) {
          if (event.typeIds == 0) {
            emit(StoreTransactionsLoaded(
              (this.state as StoreTransactionsLoaded).transactions,
              null,
              null,
              hasReachedMax: true,
            ));
          } else if (event.typeIds == 1) {
            emit(StoreTransactionsLoaded(
              null,
              (this.state as StoreTransactionsLoaded).activityTransactions,
              null,
              hasReachedMax: true,
            ));
          } else {
            emit(StoreTransactionsLoaded(
              null,
              null,
              (this.state as StoreTransactionsLoaded).bonusTransactions,
              hasReachedMax: true,
            ));
          }
        } else {
          isLoadingMore = true;
          pageTransaction++;
          var apiResponse = await storeRepository.fetchTransactionsStoreId(
              pageTransaction, event.limit, event.typeIds,
              id: storeId!);
          if (event.typeIds == 0) {
            if (apiResponse!.result.length == 0) {
              emit(StoreTransactionsLoaded(
                  List.from(
                      (this.state as StoreTransactionsLoaded).transactions!)
                    ..addAll(apiResponse.result),
                  null,
                  null,
                  hasReachedMax: true));
              pageTransaction = 1;
            } else {
              emit(StoreTransactionsLoaded(
                  List.from(
                      (this.state as StoreTransactionsLoaded).transactions!)
                    ..addAll(apiResponse.result),
                  null,
                  null));
            }
          } else if (event.typeIds == 1) {
            if (apiResponse!.result.length == 0) {
              emit(StoreTransactionsLoaded(
                  null,
                  List.from((this.state as StoreTransactionsLoaded)
                      .activityTransactions!)
                    ..addAll(apiResponse.result),
                  null,
                  hasReachedMax: true));
              pageTransaction = 1;
            } else {
              emit(StoreTransactionsLoaded(
                  null,
                  List.from((this.state as StoreTransactionsLoaded)
                      .activityTransactions!)
                    ..addAll(apiResponse.result),
                  null));
            }
          } else if (event.typeIds == 2) {
            if (apiResponse!.result.length == 0) {
              emit(StoreTransactionsLoaded(
                  null,
                  null,
                  List.from((this.state as StoreTransactionsLoaded)
                      .bonusTransactions!)
                    ..addAll(apiResponse.result),
                  hasReachedMax: true));
              pageTransaction = 1;
            } else {
              emit(StoreTransactionsLoaded(
                null,
                null,
                List.from(
                    (this.state as StoreTransactionsLoaded).bonusTransactions!)
                  ..addAll(apiResponse.result),
              ));
            }
          }
        }
      }
    } catch (e) {
      emit(StoreFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadStoreCampaignVouchers(
      LoadStoreCampaignVouchers event, Emitter<StoreState> emit) async {
    emit(StoreCampaignVoucherLoading());
    try {
      var apiResponse = await storeRepository.fetchCampaignVoucherStoreId(
          event.page, event.limit, event.search);
      // bool hasReachedMax = false;

      emit(StoreCampaignVoucherLoaded(
          campaignStoreCart:
              CampaignStoreCartModel(campaignVouchers: apiResponse!.result)));
    } catch (e) {
      emit(StoreFailed(error: e.toString()));
    }
  }

  Future<void> _onScanVoucherCode(
      ScanVoucherCode event, Emitter<StoreState> emit) async {
    emit(ScanVoucherLoading());
    try {
      var apiResponse = await storeRepository.postScanVoucherCode(
          storeId: event.storeId,
          voucherCode: event.voucherCode,
          description: event.description,
          state: true);
      var check = apiResponse.keys.first;
      if (check) {
        String result = apiResponse.values.first;
        emit(ScanVoucherSuccess(result: result));
      } else {
        String error = apiResponse.values.first;
        emit(ScanVoucherFailed(error: error));
      }
    } catch (e) {
      emit(StoreFailed(error: e.toString()));
    }
  }

  Future<void> _onCreateBonus(
      CreateBonus event, Emitter<StoreState> emit) async {
    emit(CreateBonusLoading());
    try {
      var apiResponse = await storeRepository.createBonus(
          storeId: event.storeId,
          studentId: event.studentId,
          amount: event.amount,
          description: event.description,
          state: event.state);

      emit(CreateBonusSucess(transactModel: apiResponse!));
    } catch (e) {
      emit(CreateBonusFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadCampaignVoucherDetail(
      LoadCampaignVoucherDetail event, Emitter<StoreState> emit) async {
    emit(StoreCampaignVoucherDetailLoading());
    try {
      var apiResponse = await storeRepository.fetchCampaignVoucherDetail(
          storeId: event.storeId,
          campaignVoucherDetailId: event.campaignVoucherId);

      emit(StoreCampaignVoucherDetailLoaded(
          campaignVoucherDetailModel: apiResponse!));
    } catch (e) {
      emit(StoreCampaignVoucherDetailFailed(error: e.toString()));
    }
  }

  Future<void> _onUpdateStore(
      UpdateStore event, Emitter<StoreState> emit) async {
    emit(StoreUpding());
    try {
      var apiResponse = await storeRepository.updateStore(
          areaId: event.areaId,
          storeName: event.storeName,
          address: event.address,
          avatar: event.avatar,
          openHours: event.openHours,
          closeHours: event.closeHours,
          description: event.description,
          storeId: event.storeId,
          state: event.state);
      if (apiResponse == null) {
        emit(StoreUpdateFailed(error: 'Cập nhật thất bại'));
      } else {
        emit(StoreUpdateSuccess(storeModel: apiResponse));
      }
    } catch (e) {
      emit(StoreUpdateFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadCampaignVoucherInformation(
      LoadCampaignVoucherInformation event, Emitter<StoreState> emit) async {
    emit(StoreCampaignVoucherInforLoading());
    try {
      var apiResponse = await storeRepository.fecthCampaignVoucherInformation(
          storeId: event.storeId, voucherCode: event.voucherCode);
      var check = apiResponse.keys.first;
      if (check) {
        var result = apiResponse.values.first;
        emit(StoreCampaigVoucherInforSuccess(
            campaignVoucherInformationModel: result!));
      } else {
        var result = apiResponse.values.first;
        emit(StoreCampaignVoucherInforFailed(error: result!));
      }
    } catch (e) {
      emit(StoreCampaignVoucherInforFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadStoreById(
      LoadStoreById event, Emitter<StoreState> emit) async {
    emit(StoreByIdLoading());
    try {
      var apiResponse =
          await storeRepository.fetchStoreById(storeId: event.storeId);
      // bool hasReachedMax = false;

      emit(StoreByIdLoaed(
          storeModel: apiResponse!));
    } catch (e) {
      emit(StoreFailed(error: e.toString()));
    }
  }
}
