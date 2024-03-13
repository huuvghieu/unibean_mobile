import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../screens.dart';

class CampaignCarousel extends StatefulWidget {
  final List<CampaignModel> campaigns;
  final roleState;
  const CampaignCarousel(
      {super.key, required this.campaigns, required this.roleState});

  @override
  State<CampaignCarousel> createState() => _CampaignCarouselState();
}

class _CampaignCarouselState extends State<CampaignCarousel> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<CampaignModel> camps = [
      widget.campaigns[0],
      widget.campaigns[1],
      widget.campaigns[2],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 205,
                autoPlayInterval: Duration(seconds: 20),
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              items: camps.map((campaign) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(0, 5),
                                blurRadius: 5)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Container(
                              width: 300,
                              height: 160,
                              child: Image.network(
                                campaign.image,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/image-404.jpg',
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 200,
                                margin: EdgeInsets.only(right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      campaign.campaignName,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                    Text(
                                      campaign.description,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextButton(
                                  onPressed: () {
                                    if (widget.roleState is RoleAppUnknown) {
                                      Navigator.pushNamed(
                                          context, LoginScreen.routeName);
                                    } else {
                                      Navigator.pushNamed(context,
                                          CampaignDetailScreen.routeName,
                                          arguments: campaign.id);
                                    }
                                  },
                                  child: Text(
                                    'Xem ngay',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList()),
        ),
        const SizedBox(
          height: 10,
        ),
        buildIndicator(camps.length),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildImage(String assetImage, int index) => Container(
        child: Stack(
          children: [
            Positioned(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(assetImage))),
            ))
          ],
        ),
      );

  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        effect: SlideEffect(
            activeDotColor: kPrimaryColor,
            dotWidth: 20,
            dotHeight: 5,
            dotColor: Color.fromARGB(255, 216, 216, 216)),
      );
}
