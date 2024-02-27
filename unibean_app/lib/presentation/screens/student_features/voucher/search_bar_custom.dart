import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import 'filter_voucher_screen.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({super.key});

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  late final List<String> _suggestions;

  @override
  void initState() {
    super.initState();
    _suggestions = [
      'Acer',
      'Android',
      'Apple',
      'Bàn phím',
      'Logitech',
      'Razer',
      'SmartTech'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 20.0),
        Expanded(
          flex: 6,
          child: SearchAnchor(
              viewBackgroundColor: kPrimaryColor,
              isFullScreen: false,
              viewConstraints: const BoxConstraints(
                maxHeight: 400.0,
              ),
              builder: (BuildContext context, SearchController controller) {
                return Container(
                  height: 45,
                  child: SearchBar(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(
                      Icons.search_rounded,
                      color: Colors.black54,
                    ),
                    onSubmitted: (value) {
                      // String searchString = controller.text;
                      // FocusScope.of(context).unfocus();
                      // Navigator.pushNamed(context, '/product-list-search-screen',
                      //     arguments: searchString);
                      handleSearch(value, context);
                    },
                    hintText: 'Tìm kiếm theo tên ưu đãi hoặc thương hiệu',
                    hintStyle: MaterialStateProperty.all(
                        const TextStyle(color: Colors.grey)),
                    overlayColor: MaterialStateProperty.all(kPrimaryColor),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                        const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.grey, width: 1.0)),
                  ),
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                final keyword = controller.value.text;
                return _suggestions
                    .where((element) =>
                        element.toLowerCase().contains(keyword.toLowerCase()))
                    .map((item) {
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                        Navigator.pushNamed(
                            context, '/product-list-search-screen',
                            arguments: item);
                        FocusScope.of(context).unfocus();
                      });
                    },
                  );
                }).toList();
              }),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                )
              ],
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              icon: const Icon(Icons.filter_list_rounded),
              color: kPrimaryColor,
              iconSize: 32.0,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FilterVoucherScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void handleSearch(String value, BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, '/product-list-search-screen',
        arguments: value);
  }
}
