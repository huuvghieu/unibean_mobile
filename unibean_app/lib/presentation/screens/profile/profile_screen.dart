import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/images/background_splash.png'),
        //           fit: BoxFit.cover)),
        // ),
        toolbarHeight: 160 * hem,
        centerTitle: true,
        title: Text('UNI Student Bean',
        style: GoogleFonts.nunito(
          textStyle: TextStyle(
            fontSize: 30*ffem,
            fontWeight: FontWeight.w900,
            height: 1.3625*ffem/fem,
            color: Colors.white
          )
        ),),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Body(),
    );
  }
}
