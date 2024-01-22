import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: 200 * hem,
                      // height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(300, 100)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/background_splash.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    top: 65,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 35 * fem,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100 * hem,
                    left: 23 * fem,
                    child: Container(
                      width: 330 * fem,
                      height: 150 * hem,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/voucher-banner.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
