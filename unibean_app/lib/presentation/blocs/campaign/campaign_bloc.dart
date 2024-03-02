import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:unibean_app/domain/repositories.dart';

part 'campaign_event.dart';
part 'campaign_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final CampaignRepository campaignRepository;

  CampaignBloc({required this.campaignRepository}) : super(CampaignInitial(null)) {
    on<LoadCampaigns>(_onLoadCampaigns);
    on<LoadMoreCampaigns>(_onLoadMoreCampaigns);
  }

  ScrollController scrollController = ScrollController();
  var isLoadingMore = false;
  int page = 1;
  
  //Function--------
  Future<void> _onLoadCampaigns(
      LoadCampaigns event, Emitter<CampaignState> emit) async {
    emit(CampaignLoading(null));
    try {
      var apiResponse = await campaignRepository.fecthCampaigns(
          page: event.page, limit: event.limit);
      emit(CampaignsLoaded(campaigns: apiResponse!.result.toList()));
    } catch (e) {
      emit(CampaignsFailed(null, error: e.toString()));
    }
  }

  Future<void> _onLoadMoreCampaigns(
      LoadMoreCampaigns event, Emitter<CampaignState> emit) async {
    try {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoadingMore = true;
        page++;
        var apiResponse = await campaignRepository.fecthCampaigns(page: page);
        emit(CampaignsLoaded(
            campaigns: [...state.campaigns, ...apiResponse!.result]));
      }
    } catch (e) {
      emit(CampaignsFailed(null, error: e.toString()));
    }
  }
}
