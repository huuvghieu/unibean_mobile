import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/models.dart';

import '../../../domain/repositories.dart';

part 'campaign_store_event.dart';
part 'campaign_store_state.dart';

class CampaignStoreBloc extends Bloc<CampaignStoreEvent, CampaignStoreState> {
  final CampaignRepository campaignRepository;
  CampaignStoreBloc({required this.campaignRepository})
      : super(CampaignStoreInitial()) {
    on<LoadCampaignStoreById>(_onLoadCampaignStoreById);
  }

  Future<void> _onLoadCampaignStoreById(
      LoadCampaignStoreById event, Emitter<CampaignStoreState> emit) async {
    emit(CampaignStoreLoading());
    try {
      var apiResponse = await campaignRepository.fecthCampaignStoreById(
        event.page,
        event.limit,
        id: event.id,
      );
      emit(CampaignStoreByIdLoaded(campaignStores: apiResponse!.result));
    } catch (e) {
      emit(CampaignStoresFailed(error: e.toString()));
    }
  }
}
