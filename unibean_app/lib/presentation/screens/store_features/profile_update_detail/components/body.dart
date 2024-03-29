import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/models.dart';
import '../../../../../domain/repositories.dart';
import '../../../../blocs/blocs.dart';
import 'form_update.dart';

class Body extends StatelessWidget {
  Body({super.key, required this.storeModel});

  final StoreModel storeModel;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20 * hem,
                  ),
                  Text(
                    'Thông tin cá nhân',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    height: 20 * hem,
                  ),
                  BlocProvider(
                    create: (context) => StoreBloc(
                        storeRepository: context.read<StoreRepository>()),
                    child: FormUpdate(
                      ffem: ffem,
                      fem: fem,
                      hem: hem,
                      storeModel: storeModel,
                    ),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
