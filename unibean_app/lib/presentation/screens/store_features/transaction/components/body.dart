import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/blocs/store/store_bloc.dart';
import 'package:unibean_app/presentation/screens/store_features/transaction/components/all_transaction.dart';
import 'package:unibean_app/presentation/screens/store_features/transaction/components/bonus_transaction.dart';

import '../../../../config/constants.dart';
import 'activity_transaction.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.storeId});
  final String storeId;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
      return [
        new SliverAppBar(
          pinned: true,
          floating: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_splash.png'),
                    fit: BoxFit.cover)),
          ),
          toolbarHeight: 40 * hem,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10 * hem),
            child: Text(
              'UniBean',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 22 * ffem,
                      fontWeight: FontWeight.w900,
                      color: Colors.white)),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 10 * hem, right: 20 * fem),
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 25 * fem,
                ),
                onPressed: () {},
              ),
            ),
          ],
          bottom: TabBar(
            onTap: (value) {
              if (value == 1) {
                context
                    .read<StoreBloc>()
                    .add(LoadStoreTransactions(typeIds: 1, id: storeId));
              } else if (value == 2) {
                context
                    .read<StoreBloc>()
                    .add(LoadStoreTransactions(typeIds: 2, id: storeId));
              } else {
                context
                    .read<StoreBloc>()
                    .add(LoadStoreTransactions(typeIds: 0, id: storeId));
              }
            },
            
            automaticIndicatorColorAdjustment: false,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            indicatorPadding: EdgeInsets.only(bottom: 1 * fem),
            labelColor: Colors.white,
            labelStyle: GoogleFonts.openSans(
                textStyle: TextStyle(
              fontSize: 13 * ffem,
              fontWeight: FontWeight.w700,
            )),
            unselectedLabelColor: Colors.white60,
            unselectedLabelStyle: GoogleFonts.openSans(
                textStyle: TextStyle(
              fontSize: 13 * ffem,
              fontWeight: FontWeight.w700,
            )),
            tabs: [
              Tab(
                text: 'Tất cả',
              ),
              Tab(
                text: 'Hoạt động',
              ),
              Tab(
                text: 'Tặng đậu',
              ),
            ],
          ),
        )
      ];
    }, body: BlocBuilder<StoreBloc, StoreState>(
      builder: (context, state) {
        if (state is StoreTransactionLoading) {
          return Container(
              color: klighGreyColor,
              child: Center(
                  child:
                      Lottie.asset('assets/animations/loading-screen.json')));
        } else if (state is StoreTransactionsLoaded) {
          return TabBarView(
            children: [
              AllTransaction(
                fem: fem,
                hem: hem,
                ffem: ffem,
                storeId: storeId,
              ),
              ActivityTransaction(
                fem: fem,
                hem: hem,
                ffem: ffem,
                storeId: storeId,
              ),
              BonusTransaction(hem: hem, fem: fem, ffem: ffem, storeId: storeId)
            ],
          );
        }
        return Container();
      },
    ));
  }
}
