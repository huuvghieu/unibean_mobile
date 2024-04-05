import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
// import 'package:unibean_app/presentation/screens/student_features/voucher/components/filter/filter_body.dart';

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
    _suggestions = ['Bình giữ nhiệt', 'Gấu bông'];
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
               viewOnSubmitted: (value) {
                FocusScope.of(context).unfocus(); 
                Navigator.pushNamed(
                    context, ProductListScreen.routeName,
                    arguments: value);
                    
              },
              builder: (BuildContext context, SearchController controller) {
                return Container(
                  height: 45,
                  child: SearchBar(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    controller: controller,
                    // padding: const MaterialStatePropertyAll<EdgeInsets>(
                    //     EdgeInsets.symmetric(horizontal: 16.0)),
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
                    FocusScope.of(context).unfocus(); 
                    },
                    hintText: 'Tìm kiếm theo tên sản phẩm',
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
                            context, ProductListScreen.routeName,
                            arguments: item);
                        FocusScope.of(context).unfocus();
                      });
                    },
                  );
                }).toList();
              }),
        ),
        const SizedBox(width: 20.0),
      ],
    );
  }


  void handleSearch(String value, BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, ProductListScreen.routeName, arguments: value);
  }
}
