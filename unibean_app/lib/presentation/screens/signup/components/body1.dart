import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';

import '../../screens.dart';

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
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg_signup_1.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 130 * hem,
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
                            image: AssetImage('assets/images/ava_signup.png'))),
                  ),
            SizedBox(
              height: 10 * hem,
            ),
            Text(
              'Chúng tôi sẽ kết nối với\n Gmail của bạn!',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 20 * hem,
            ),
            Text(
              'Hãy kiểm tra thông tin thật cẩn thận',
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 40 * hem,
            ),
            Container(
              width: 318 * fem,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 2.5 * fem,
                    )
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 40 * hem,
                  ),
                  TextFormFieldDefault(
                    hem: hem,
                    fem: fem,
                    ffem: ffem,
                    labelText: 'GMAIL',
                    hintText: 'unibean@fpt.edu.vn',
                  ),
                  SizedBox(
                    height: 25 * hem,
                  ),
                  TextFormFieldDefault(
                      hem: hem,
                      fem: fem,
                      ffem: ffem,
                      labelText: 'HỌ VÀ TÊN *',
                      hintText: 'Mafalda Matias'),
                  SizedBox(
                    height: 40 * hem,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20 * hem,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUp2Screen.routeName);
              },
              child: Container(
                width: 300 * fem,
                height: 45 * hem,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(23 * fem)),
                child: Center(
                  child: Text(
                    'Tiếp tục',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.3625 * ffem / fem,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _pickerImageFromGallery();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 2 * fem, bottom: 20 * hem),
                child: Text(
                  'Thêm hình cá nhân',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w900,
                          height: 1.3625 * ffem / fem,
                          color: kPrimaryColor)),
                ),
              ),
            )
          ],
        ),
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
}
