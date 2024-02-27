part of 'campaign_bloc.dart';

sealed class CampaignEvent extends Equatable {
  const CampaignEvent();
}

final class LoadCampaigns extends CampaignEvent {
  @override
  List<Object?> get props => [];
}
