part of 'campaign_bloc.dart';

sealed class CampaignState extends Equatable {
  final campaigns;

  const CampaignState(this.campaigns);
  @override
  List<Object?> get props => [campaigns];
}

final class CampaignInitial extends CampaignState {
  CampaignInitial(super.campaigns);
}

final class CampaignLoading extends CampaignState {
  CampaignLoading(super.campaigns);
}

final class CampaignsLoaded extends CampaignState {
  CampaignsLoaded({required campaigns}) : super(campaigns);

}

final class CampaignsFailed extends CampaignState {
  final String error;

  CampaignsFailed(super.campaigns, {required this.error});
    @override
  List<Object?> get props => [error];
}
