class CampaignModel {
  final String name;
  final String assetImage;

  CampaignModel({required this.name, required this.assetImage});
  static List<CampaignModel> listCampaign = [
    CampaignModel(
        name: 'TRAO LÌ XÌ ĐỎ - ĐIỀU MAY CHẠM NGÕ',
        assetImage: 'assets/images/koi-campaign.jpg'),
    CampaignModel(
        name: 'VUI ĐÓN TẾT TẶNG - BỘ BẦU CUA CÁ GÀ',
        assetImage: 'assets/images/texas-campagin.jpg'),
    CampaignModel(
        name: 'TRAO LÌ XÌ ĐỎ - ĐIỀU MAY CHẠM NGÕ',
        assetImage: 'assets/images/koi-campaign.jpg'),
    CampaignModel(
        name: 'VUI ĐÓN TẾT TẶNG - BỘ BẦU CUA CÁ GÀ',
        assetImage: 'assets/images/texas-campagin.jpg'),
  ];
}
