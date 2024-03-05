part of 'campaign_bloc.dart';

sealed class CampaignEvent extends Equatable {
  const CampaignEvent();
}

final class LoadCampaigns extends CampaignEvent {
  final int page;
  final int limit;

  LoadCampaigns({this.page = 1, this.limit = 3});
  @override
  List<Object?> get props => [page, limit];
}

final class LoadMoreCampaigns extends CampaignEvent {
  final int page;
  final int limit;

  LoadMoreCampaigns({this.page = 1, this.limit = 3});
  @override
  List<Object?> get props => [page, limit];
}
