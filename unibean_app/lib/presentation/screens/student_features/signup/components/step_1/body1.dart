import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import 'form_1.dart';

// import '../../../screens.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _BodyState();
}

class _BodyState extends State<Body1> {
  File? _selectedImage;

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
              Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/bg_signup_1.png'),
                )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100 * hem,
                    ),
                    _selectedImage != null
                        ? Container(
                            margin: EdgeInsets.only(bottom: 30 * hem),
                            width: 180 * fem,
                            height: 180 * hem,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(_selectedImage!))),
                          )
                        : Container(
                            width: 210 * fem,
                            height: 210 * fem,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/ava_signup.png'))),
                          ),
                    SizedBox(
                      height: 10 * hem,
                    ),
                    FormBody1(
                      ffem: ffem,
                      fem: fem,
                      hem: hem,
                      avatar: _selectedImage,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     // _pickerImageFromGallery();
                    //     _imageModelBottomSheet(context);
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 2 * fem, bottom: 20 * hem),
                    //     child: Text(
                    //       'Thêm hình cá nhân',
                    //       style: GoogleFonts.openSans(
                    //           textStyle: TextStyle(
                    //               fontSize: 13 * ffem,
                    //               fontWeight: FontWeight.w900,
                    //               height: 1.3625 * ffem / fem,
                    //               color: kPrimaryColor)),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Future _pickerImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;

    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickerImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;

    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  void _imageModelBottomSheet(context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _pickerImageFromCamera();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: kPrimaryColor,
                        size: 30 * fem,
                      ),
                      SizedBox(
                        width: 5 * fem,
                      ),
                      Text(
                        'Chụp ảnh',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.bold,
                                height: 1.3625 * ffem / fem,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18 * hem,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Divider(
                    color: kLowTextColor,
                    thickness: 2 * fem,
                    // height: 300*fem,
                  ),
                ),
                SizedBox(
                  height: 18 * hem,
                ),
                InkWell(
                  onTap: () {
                    _pickerImageFromGallery();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_size_select_actual_rounded,
                        color: kPrimaryColor,
                        size: 30 * fem,
                      ),
                      SizedBox(
                        width: 5 * fem,
                      ),
                      Text(
                        'Chọn sẵn có',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.bold,
                                height: 1.3625 * ffem / fem,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
