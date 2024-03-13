import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IsClaimedChallenge extends StatelessWidget {
  const IsClaimedChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    // double baseHeight = 812;
    // double hem = MediaQuery.of(context).size.height / baseHeight;
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: Text(
                      'Chưa có nhiệm vụ hoàn thành',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 20 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      )),
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
