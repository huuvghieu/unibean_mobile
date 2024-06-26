import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/widgets/shimmer_widget.dart';
import '../blocs/blocs.dart';
import '../screens/screens.dart';
import 'unverified_screen.dart';

class BrandCard extends StatelessWidget {
  const BrandCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.brandModel});

  final double fem;
  final double hem;
  final double ffem;
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    final roleState = context.read<RoleAppBloc>().state;

    return InkWell(
      onTap: () {
        if (roleState is Unverified) {
          Navigator.pushNamed(context, UnverifiedScreen.routeName);
        } else {
          Navigator.pushNamed(context, BrandDetailScreen.routeName,
              arguments: brandModel.id);
        }
      },
      child: Container(
        width: 80 * fem,
        margin: EdgeInsets.only(left: 5 * fem, right: 5 * fem),
        child: Column(
          children: [
            Container(
              width: 80 * fem,
              height: 80 * hem,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10 * fem),
                child: Image.network(
                  brandModel.logo,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return ShimmerWidget.rectangular(height: 80 * hem);
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/image-404.jpg',
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5 * hem),
              child: Text(
                brandModel.brandName,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  fontSize: 12 * ffem,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
