import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/student/student_bloc.dart';

import '../../../../../domain/repositories.dart';
import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return BlocProvider(
      create: (context) =>
          StudentBloc(studentRepository: context.read<StudentRepository>())
            ..add(LoadStudentOrders(id: id)),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20 * fem,
              ),
              BlocBuilder<StudentBloc, StudentState>(
                builder: (context, state) {
                  if (state is StudentOrdersLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.orderModels.length,
                          itemBuilder: (context, index) {
                            var order = state.orderModels[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, CampaignDetailScreen.routeName);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 15 * hem,
                                    left: 20 * fem,
                                    right: 20 * fem),
                                padding: EdgeInsets.only(
                                  left: 15*fem,
                                  right: 15*fem
                                ),
                                constraints: BoxConstraints(
                                    maxHeight: 150 * hem, minWidth: 340 * fem),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(15 * fem),
                                    color: Colors.white,
                                    border: Border.all(color: klighGreyColor),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0x0c000000),
                                          offset: Offset(0 * fem, 0 * fem),
                                          blurRadius: 5 * fem)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                      
                                          child: Container(
                                            width: 100 * fem,
                                            height: 80 * hem,
                                            child: Image.asset(
                                              'assets/images/bean_logo.jpg',
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Icon(
                                                  Icons.error_outlined,
                                                  size: 50 * fem,
                                                  color: kPrimaryColor,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 5 * hem,
                                              ),
                                              child: Text('Trạm',
                                                  textAlign: TextAlign.center,
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ))),
                                            ),
                                            Text(order.stationName,
                                                textAlign: TextAlign.center,
                                                softWrap: true,
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis,
                                                style: GoogleFonts.openSans(
                                                    textStyle: TextStyle(
                                                  fontSize: 16 * ffem,
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w600,
                                                ))),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Thời gian đặt:',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              color: kLowTextColor,
                                              fontWeight: FontWeight.w600,
                                            ))),
                                        Text(
                                            '${_formatDatetime(order.dateCreated)}',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            )))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Tình trạng:',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              color: kLowTextColor,
                                              fontWeight: FontWeight.w600,
                                            ))),
                                        Text(
                                            '${order.currentStateName}',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            )))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else if (state is StudentOrderLoading) {
                    return Container();
                  }
                  return Center(
                      child: Lottie.asset(
                          'assets/animations/loading-screen.json',
                          width: 50 * fem,
                          height: 50 * hem));
                },
              )
            ]),
          )
        ],
      ),
    );
  }
}

String _formatDatetime(String date) {
  DateTime dateTime = DateTime.parse(date).add(Duration(hours: 7));

  String formattedDatetime = DateFormat("HH:mm - dd/MM/yyyy").format(dateTime);
  return formattedDatetime;
}
