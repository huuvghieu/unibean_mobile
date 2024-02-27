part of 'campaign_bloc.dart';

sealed class CampaignState extends Equatable {
  const CampaignState();
}

final class CampaignInitial extends CampaignState {
  @override
  List<Object> get props => [];
}

final class CampaignLoading extends CampaignState {
  @override
  List<Object?> get props => [];
}

final class CampaignsLoaded extends CampaignState {
  final List<CampaignModel> campaigns;

  CampaignsLoaded({required this.campaigns});
  @override
  List<Object?> get props => [campaigns];
}

final class CampaignsFailed extends CampaignState {
  final String error;

  CampaignsFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
