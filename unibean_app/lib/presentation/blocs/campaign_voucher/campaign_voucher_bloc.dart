import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'campaign_voucher_event.dart';
part 'campaign_voucher_state.dart';

class CampaignVoucherBloc
    extends Bloc<CampaignVoucherEvent, CampaignVoucherState> {
  final CampaignRepository campaignRepository;
  CampaignVoucherBloc({required this.campaignRepository})
      : super(CampaignVoucherInitial()) {
    on<LoadCampaignVoucher>(_onLoadCampaignVouchers);
    on<LoadCampaignVoucherById>(_onLoadCampaignVoucherById);
  }

  Future<void> _onLoadCampaignVouchers(
      LoadCampaignVoucher event, Emitter<CampaignVoucherState> emit) async {
    emit(CampaignVoucherLoading());
    try {
      var apiResponse = await campaignRepository
          .fecthCampaignVouchersById(event.page, event.limit, id: event.id);
      emit(CampaignVouchersLoaded(
          campaignVouchers: apiResponse!.result.toList()));
    } catch (e) {
      emit(CampaignVoucherFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadCampaignVoucherById(
      LoadCampaignVoucherById event, Emitter<CampaignVoucherState> emit) async {
    emit(CampaignVoucherLoading());
    try {
      var campaignVoucherDetail =
          await campaignRepository.fecthCampaignVoucherDetailById(
              campaignId: event.campaignId,
              campaignVoucherId: event.campaignVoucherId);
      if (campaignVoucherDetail != null) {
        emit(CampaignVoucherByIdLoaded(
            campaignVoucherDetail: campaignVoucherDetail));
      }
    } catch (e) {
      emit(CampaignVoucherFailed(error: e.toString()));
    }
  }
}
