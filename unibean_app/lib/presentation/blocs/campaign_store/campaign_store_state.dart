part of 'campaign_store_bloc.dart';

sealed class CampaignStoreState extends Equatable {
  const CampaignStoreState();

}

final class CampaignStoreInitial extends CampaignStoreState {
    
  @override
  List<Object> get props => [];
}

final class CampaignStoreLoading extends CampaignStoreState {
  CampaignStoreLoading();
  @override
  List<Object?> get props => [];
}


final class CampaignStoreByIdLoaded extends CampaignStoreState {
  final List<CampaignStoreModel> campaignStores;

  CampaignStoreByIdLoaded({required this.campaignStores});

  @override
  List<Object?> get props => [campaignStores];
}

final class CampaignStoresFailed extends CampaignStoreState {
  final String error;

  CampaignStoresFailed({required this.error});
  @override
  List<Object?> get props => [error];
}