class Brand {
  final String name;
  final String assetImage;

  Brand({required this.name, required this.assetImage});
  static List<Brand> listBrand = [
    Brand(name: 'F-Code Club', assetImage: 'assets/images/fcode-banner.png'),
    Brand(name: 'FPT Event Club', assetImage: 'assets/images/fev-banner.png'),
    Brand(name: 'Bean Ơi', assetImage: 'assets/images/beanoi-banner.png'),
    Brand(name: 'Highland Coffee',assetImage: 'assets/images/highland-logo.jpg' )
  ];
}
