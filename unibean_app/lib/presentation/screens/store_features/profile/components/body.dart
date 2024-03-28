import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import '../../../../blocs/blocs.dart';
import 'button_profile.dart';
import 'name_profile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: BlocBuilder<RoleAppBloc, RoleAppState>(
          builder: (context, state) {
            if (state is StoreRole) {
              final storeModel = state.storeModel;
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/background_splash.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          //background body
                          Positioned(
                            left: 0 * fem,
                            top: 120 * hem,
                            child: Align(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  color: klighGreyColor),
                            ),
                          ),

                          //widget information of profile
                          Positioned(
                            top: 80 * hem,
                            left: 25 * fem,
                            child: Container(
                              width: 324 * fem,
                              height: 200 * hem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15 * fem),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10 * hem,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 25 * fem,
                                      ),

                                      //avatar
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              '${storeModel.avatar}',
                                              // 'assets/images/ava_signup.png',
                                              width: 80 * fem,
                                              height: 80 * hem,
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/images/ava_signup.png',
                                                  width: 80 * fem,
                                                  height: 80 * hem,
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0 * hem,
                                            right: 0 * fem,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
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
                                        width: 20 * fem,
                                      ),

                                      SizedBox(
                                        // color: Colors.red,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Name
                                            NameProfile(
                                              fem: fem,
                                              ffem: ffem,
                                              hem: hem,
                                              name: storeModel.storeName,
                                            ),
                                            //email
                                            SizedBox(
                                              width: 150 * fem,
                                              child: Text(
                                                '${storeModel.email}',
                                                maxLines: 1,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.openSans(
                                                    textStyle: TextStyle(
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: klowTextGrey)),
                                              ),
                                            ),
                                            // //student code
                                            // StudentCodeProfile(
                                            //   hem: hem,
                                            //   fem: fem,
                                            //   ffem: ffem,
                                            //   studentCode: studentModel.code,
                                            // ),
                                            // //university name
                                            // UniversityProfile(
                                            //   fem: fem,
                                            //   hem: hem,
                                            //   ffem: ffem,
                                            //   university: studentModel.universityName,
                                            // )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10 * fem,
                                  ),
                                  SizedBox(
                                    width: 280 * fem,
                                    child: Divider(
                                      thickness: 1 * fem,
                                      color: const Color.fromARGB(
                                          255, 225, 223, 223),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 10 * hem,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: ()  {
                                          
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 5 * fem, right: 5 * fem),
                                            width: 140 * fem,
                                            height: 40 * hem,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[100],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: SvgPicture.asset(
                                                    'assets/icons/campaign-navbar-icon.svg',
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            kPrimaryColor,
                                                            BlendMode.srcIn),
                                                    height: 18 * fem,
                                                    width: 18 * fem,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5 * fem,
                                                ),
                                                Text(
                                                  '${storeModel.numberOfCampaigns} chiến dịch',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                          fontSize: 12 * fem,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1.3625 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              kPrimaryColor)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 5 * fem, right: 5 * fem),
                                            width: 140 * fem,
                                            height: 40 * hem,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[100],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: SvgPicture.asset(
                                                    'assets/icons/voucher-navbar-icon.svg',
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            kPrimaryColor,
                                                            BlendMode.srcIn),
                                                    height: 15 * fem,
                                                    width: 15 * fem,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5 * fem,
                                                ),
                                                Text(
                                                  '${storeModel.numberOfVouchers} ưu đãi',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                          fontSize: 12 * fem,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          height: 1.3625 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              kPrimaryColor)),
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
                            ),
                          ),

                          Positioned(
                              left: 0 * fem,
                              top: 300 * hem,
                              child: Container(
                                // color: Colors.red,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,

                                child: Column(
                                  children: [
                                    ButtonProfile(
                                      fem: fem,
                                      hem: hem,
                                      ffem: ffem,
                                      widthIcon: 16,
                                      heightIcon: 16,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, ProductScreen.routeName);
                                      },
                                      svgIcon:
                                          'assets/icons/pen-icon.svg',
                                      title: 'Sửa thông tin',
                                    ),
                                    SizedBox(
                                      height: 10 * hem,
                                    ),
                                 
                                    //button logout
                                    ButtonProfile(
                                        fem: fem,
                                        hem: hem,
                                        ffem: ffem,
                                        svgIcon: 'assets/icons/logout-icon.svg',
                                        title: 'Đăng xuất',
                                        onPressed: () =>
                                            _dialogLogout(context)),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                child: Text('Error'),
              );
            }
          },
        ));
  }

  Future<void> _dialogLogout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Bạn có muốn đăng xuất không?',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700)),
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Không',
                    style: GoogleFonts.openSans(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<RoleAppBloc>().add(RoleAppEnd());
                    context
                        .read<LandingScreenBloc>()
                        .add(TabChange(tabIndex: 0));

                    Navigator.pushNamedAndRemoveUntil(context,
                        LoginScreen.routeName, (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Có',
                    style: GoogleFonts.openSans(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  )),
            ],
          );
        });
  }
}
