import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCampaign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCampaign({
    super.key,
    required this.hem,
    required this.ffem,
    required this.fem,
  });

  final double hem;
  final double ffem;
  final double fem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_splash.png'),
                fit: BoxFit.cover)),
      ),
      toolbarHeight: 130 * hem,
      title: Padding(
        padding: EdgeInsets.only(left: 20 * fem),
        child: Text(
          'UNI Student Bean',
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  fontSize: 30 * ffem,
                  fontWeight: FontWeight.w900,
                  height: 1.3625 * ffem / fem,
                  color: Colors.white)),
        ),
      ),
      actions: [
        // SvgPicture.asset('assets/icons/notification-icon.svg')
        Padding(
          padding: EdgeInsets.only(right: 20 * fem),
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 35 * fem,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
