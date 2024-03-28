part of 'campaign_ranking_bloc.dart';

sealed class CampaignRankingState extends Equatable {
  const CampaignRankingState();
}

final class CampaignRankingInitial extends CampaignRankingState {
  @override
  List<Object?> get props => [];
}

final class CampaignRankingLoading extends CampaignRankingState {
  @override
  List<Object?> get props => [];
}

final class CampaginRankingLoaded extends CampaignRankingState {
  final List<CampaignRankingModel> campaignRankings;

  CampaginRankingLoaded({required this.campaignRankings});

  @override
  List<Object?> get props => [campaignRankings];
}

final class CampaigRankingFailed extends CampaignRankingState {
  final String error;

  CampaigRankingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
