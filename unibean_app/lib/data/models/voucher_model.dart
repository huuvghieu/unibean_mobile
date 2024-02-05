class VoucherModel {
  final String name;
  final String assetImage;

  VoucherModel({required this.name, required this.assetImage});
  static List<VoucherModel> listCampaign = [
    VoucherModel(
        name: 'Giảm 30k cho hóa đơn từ 100l - Highland Coffee',
        assetImage: 'assets/images/voucher-1.png'),
    VoucherModel(
        name: 'Giảm 60k cho khách hàng mới - Starbuck Coffee',
        assetImage: 'assets/images/voucher2.jpg'),
    VoucherModel(
        name: 'Giảm 30k cho hóa đơn từ 100l - Highland Coffee',
        assetImage: 'assets/images/voucher-1.png'),
    VoucherModel(
        name: 'Giảm 60k cho khách hàng mới - Starbuck Coffee',
        assetImage: 'assets/images/voucher2.jpg'),
  ];
}
