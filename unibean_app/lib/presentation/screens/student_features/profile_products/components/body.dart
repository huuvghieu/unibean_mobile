import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_products/components/tab_product/tab_product.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 375;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // double baseHeight = 812;
    // double hem = MediaQuery.of(context).size.height / baseHeight;

    return TabBarView(
      children: [
        TabProduct(),
        Container(
          child: Center(
            child: Text('Giỏ hàng'),
          ),
        ),
      ],
    );
  }
}
