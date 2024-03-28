import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'campaign_ranking_event.dart';
part 'campaign_ranking_state.dart';

class CampaignRankingBloc
    extends Bloc<CampaignRankingEvent, CampaignRankingState> {
  final StoreRepository storeRepository;
  CampaignRankingBloc({required this.storeRepository})
      : super(CampaignRankingInitial()) {
    on<LoadCampaignRanking>(_onLoadCampaignRanking);
  }

  Future<void> _onLoadCampaignRanking(
      LoadCampaignRanking event, Emitter<CampaignRankingState> emit) async {
    emit(CampaignRankingLoading());
    try {
      var apiResponse = await storeRepository.fecthCampaignRanking();

      emit(CampaginRankingLoaded(campaignRankings: apiResponse!));
    } catch (e) {
      emit(CampaigRankingFailed(error: e.toString()));
    }
  }
}
