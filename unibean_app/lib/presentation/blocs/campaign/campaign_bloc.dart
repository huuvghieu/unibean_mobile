import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';

part 'campaign_event.dart';
part 'campaign_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final CampaignRepository campaignRepository;

  CampaignBloc({required this.campaignRepository}) : super(CampaignInitial()) {
    on<LoadCampaigns>(_onLoadCampaigns);
  }

  Future<void> _onLoadCampaigns(
      LoadCampaigns event, Emitter<CampaignState> emit) async {
    emit(CampaignLoading());
    try {
      var apiResponse = await campaignRepository.fecthCampaigns();
      emit(CampaignsLoaded(campaigns: apiResponse!.result.toList()));
    } catch (e) {
      emit(CampaignsFailed(error: e.toString()));
    }
  }
}
