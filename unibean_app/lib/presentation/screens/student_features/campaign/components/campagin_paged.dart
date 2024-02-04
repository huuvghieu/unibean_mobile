// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:unibean_app/presentation/config/constants.dart';

// import '../../../../../data/models.dart';

// class CampaignPaged extends StatefulWidget {
//   const CampaignPaged({super.key});

//   @override
//   State<CampaignPaged> createState() => _CampaignPagedState();
// }

// class _CampaignPagedState extends State<CampaignPaged> {
//   static const _pageSize = 10;
//   final PagingController<int, CampaignModel> _pagingController =
//       PagingController(firstPageKey: 1, invisibleItemsThreshold: 2);
//   @override
//   Widget build(BuildContext context) {
//     return PagedSliverGrid<int, CampaignModel>(
//         pagingController: _pagingController,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 7.0,
//           crossAxisSpacing: 7.0,
//           childAspectRatio: 0.55,
//         ),
//         builderDelegate: PagedChildBuilderDelegate<CampaignModel>(
//           itemBuilder: (context, item, index) {
//             return GestureDetector(
//               onTap: () {},
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: kLowTextColor.withOpacity(0.3),
//                       blurRadius: 10.0, // soften the shadow
//                       spreadRadius: 1.0, //extend the shadow
//                       offset: const Offset(
//                         5.0, // Move to right 5  horizontally
//                         5.0, // Move to bottom 5 Vertically
//                       ),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Stack(
//                       children: [
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 5.0),
//                           child: Align(
//                               alignment: Alignment.center,
//                               child: Image(
//                                 image: AssetImage(
//                                   item.assetImage,
//                                 ),
//                                 fit: BoxFit.cover,
//                                 height: 150.0,
//                               )),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       item.name.toString(),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             );
//           },
//           animateTransitions: true,
//           newPageProgressIndicatorBuilder: (context) {
//             return shimmerLoading();
//           },
//           firstPageProgressIndicatorBuilder: (context) {
//             return shimmerLoading();
//           },
//         ));
//   }

//   Widget shimmerLoading() {
//     return GridView.builder(
//       itemCount: _pageSize,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 7.0,
//         crossAxisSpacing: 7.0,
//         childAspectRatio: 0.5,
//       ),
//       itemBuilder: (context, index) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey.shade300,
//           highlightColor: Colors.grey.shade100,
//           child: Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../../data/models.dart';

class CampaignPaged extends StatelessWidget {
  const CampaignPaged({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemBuilder: (context, index) {
        return GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: kLowTextColor.withOpacity(0.3),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 5.0),
                          child: Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(
                                  CampaignModel.listCampaign[index].assetImage,
                                ),
                                fit: BoxFit.cover,
                                height: 150.0,
                              )),
                        ),
                      ],
                    ),
                    Text(
                     CampaignModel.listCampaign[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            );
      },
    );
  }
}
