import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/datasource/authen_local_datasource.dart';
import '../../../../../data/models.dart';
import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import 'name_profile.dart';

class InformationCardProfile extends StatefulWidget {
  const InformationCardProfile({
    super.key,
    required this.fem,
    required this.hem,
    required this.storeModel,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final StoreModel storeModel;
  final double ffem;

  @override
  State<InformationCardProfile> createState() => _InformationCardProfileState();
}

class _InformationCardProfileState extends State<InformationCardProfile> {
  StoreModel? store;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324 * widget.fem,
      height: 200 * widget.hem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15 * widget.fem),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10 * widget.hem,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25 * widget.fem,
              ),

              //avatar
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      '${widget.storeModel.avatar}',
                      // 'assets/images/ava_signup.png',
                      width: 80 * widget.fem,
                      height: 80 * widget.hem,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/ava_signup.png',
                          width: 80 * widget.fem,
                          height: 80 * widget.hem,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0 * widget.hem,
                    right: 0 * widget.fem,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: klighGreyColor),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        weight: 1,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                width: 20 * widget.fem,
              ),

              SizedBox(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name
                    BlocBuilder<StoreBloc, StoreState>(
                      builder: (context, state) {
                        if (state is StoreByIdLoaed) {
                          return NameProfile(
                            fem: widget.fem,
                            ffem: widget.ffem,
                            hem: widget.hem,
                            name: state.storeModel.storeName,
                          );
                        }
                        return NameProfile(
                          fem: widget.fem,
                          ffem: widget.ffem,
                          hem: widget.hem,
                          name: store == null
                              ? widget.storeModel.storeName
                              : store!.storeName,
                        );
                      },
                    ),
                    //email
                    BlocBuilder<StoreBloc, StoreState>(
                      builder: (context, state) {
                        if (state is StoreByIdLoaed) {
                          return SizedBox(
                            width: 150 * widget.fem,
                            child: Text(
                              '${state.storeModel.email}',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 13 * widget.ffem,
                                      fontWeight: FontWeight.normal,
                                      color: klowTextGrey)),
                            ),
                          );
                        }
                        return SizedBox(
                          width: 150 * widget.fem,
                          child: Text(
                            store == null ? '${widget.storeModel.email}' : store!.email,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 13 * widget.ffem,
                                    fontWeight: FontWeight.normal,
                                    color: klowTextGrey)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10 * widget.fem,
          ),
          SizedBox(
            width: 280 * widget.fem,
            child: Divider(
              thickness: 1 * widget.fem,
              color: const Color.fromARGB(255, 225, 223, 223),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10 * widget.hem,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 5 * widget.fem, right: 5 * widget.fem),
                    width: 140 * widget.fem,
                    height: 40 * widget.hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/campaign-navbar-icon.svg',
                            colorFilter: ColorFilter.mode(
                                kPrimaryColor, BlendMode.srcIn),
                            height: 18 * widget.fem,
                            width: 18 * widget.fem,
                          ),
                        ),
                        SizedBox(
                          width: 5 * widget.fem,
                        ),
                        Text(
                          '${widget.storeModel.numberOfCampaigns} chiến dịch',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 12 * widget.fem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3625 * widget.ffem / widget.fem,
                                  color: kPrimaryColor)),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 5 * widget.fem, right: 5 * widget.fem),
                    width: 140 * widget.fem,
                    height: 40 * widget.hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/voucher-navbar-icon.svg',
                            colorFilter: ColorFilter.mode(
                                kPrimaryColor, BlendMode.srcIn),
                            height: 15 * widget.fem,
                            width: 15 * widget.fem,
                          ),
                        ),
                        SizedBox(
                          width: 5 * widget.fem,
                        ),
                        Text(
                          '${widget.storeModel.numberOfVouchers} ưu đãi',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 12 * widget.fem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3625 * widget.ffem / widget.fem,
                                  color: kPrimaryColor)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getStore() async {
    final storeModel = await AuthenLocalDataSource.getStore();
    setState(() {
      store = storeModel;
    });
  }
}
