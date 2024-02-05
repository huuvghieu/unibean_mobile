class ProductModel {
  final String name;
  final String assetImage;

  ProductModel({required this.name, required this.assetImage});
  static List<ProductModel> listCampaign = [
    ProductModel(
        name: 'Móc Khóa Bông Quái Vật Dễ Thương',
        assetImage: 'assets/images/product2.jpg'),
    ProductModel(
        name: 'Hộp Bút Vải Gân Nhân Vật Hoạt Hình',
        assetImage: 'assets/images/produc3.jpg'),
    ProductModel(
        name: 'Khăn Trắng Hình Dễ Thương',
        assetImage: 'assets/images/product4.jpg'),
    ProductModel(
        name: 'Khăn Trắng Hình Dễ Thương',
        assetImage: 'assets/images/product4.jpg'),
  ];
}
