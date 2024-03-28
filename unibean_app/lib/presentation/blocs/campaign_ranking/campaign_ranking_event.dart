part of 'campaign_ranking_bloc.dart';

sealed class CampaignRankingEvent extends Equatable {
  const CampaignRankingEvent();
}

final class LoadCampaignRanking extends CampaignRankingEvent {
  @override
  List<Object?> get props => [];
}
