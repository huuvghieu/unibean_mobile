import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_2/button_sign_up_2.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_2/drop_down_campus.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_2/upload_back_card.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_2/upload_front_card.dart';
import '../../../../screens.dart';
import 'drop_down_university.dart';

class FormBody2 extends StatefulWidget {
  const FormBody2({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  State<FormBody2> createState() => _FormBody2State();
}

class _FormBody2State extends State<FormBody2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController campusController = TextEditingController();
  File? _selectedFrontCard;
  File? _selectedBackCard;
  String? errorCard;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: 318 * widget.fem,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15 * widget.fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0c000000),
                    offset: Offset(0 * widget.fem, 4 * widget.fem),
                    blurRadius: 2.5 * widget.fem,
                  )
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: 25 * widget.hem,
                ),
                DropDownUniversity(
                  fem: widget.fem,
                  hem: widget.hem,
                  ffem: widget.ffem,
                  hintText: 'Chọn trường học',
                  labelText: 'TRƯỜNG *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Trường không được bỏ trống';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20 * widget.hem,
                ),
                DropDownCampus(
                  fem: widget.fem,
                  hem: widget.hem,
                  ffem: widget.ffem,
                  hintText: 'Chọn cơ sở',
                  labelText: 'CƠ SỞ *',
                  campusController: campusController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cơ sở không được bỏ trống';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20 * widget.hem,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 70 * widget.hem,
                      width: 272 * widget.fem,
                      // color: Colors.red,
                    ),
                    Positioned(
                      bottom: 5,
                      child: Container(
                        width: 272 * widget.fem,
                        height: 58 * widget.fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(12 * widget.fem)),
                          border: Border.all(
                              color: const Color.fromARGB(255, 220, 220, 220),
                              width: 2.0),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 22 * widget.fem,
                      bottom: 50 * widget.fem,
                      child: Container(
                          height: 20 * widget.hem,
                          width: 105 * widget.fem,
                          color: Colors.white,
                          child: Text(
                            'THẺ SINH VIÊN *',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 11.5 * widget.ffem,
                                  fontWeight: FontWeight.w900),
                            ),
                          )),
                    ),
                    _selectedFrontCard != null
                        ? Positioned(
                            left: 30 * widget.fem,
                            bottom: 18 * widget.fem,
                            child: InkWell(
                              onTap: () {
                                _imageModelBottomSheet(
                                    context, _selectedFrontCard);
                              },
                              child: Container(
                                width: 50 * widget.fem,
                                height: 30 * widget.hem,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(_selectedFrontCard!))),
                              ),
                            ),
                          )
                        : UpLoadFrontCard(
                            fem: widget.fem,
                            hem: widget.hem,
                            ffem: widget.ffem,
                            onPressed: () {
                              _imageModelBottomSheet(
                                  context, _selectedFrontCard);
                            },
                          ),
                    _selectedBackCard != null
                        ? Positioned(
                            left: 100 * widget.fem,
                            bottom: 18 * widget.fem,
                            child: InkWell(
                              onTap: () {
                                _imageModelBottomSheet(
                                    context, _selectedBackCard);
                              },
                              child: Container(
                                width: 50 * widget.fem,
                                height: 30 * widget.hem,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(_selectedBackCard!))),
                              ),
                            ),
                          )
                        : UpLoadBackCard(
                            fem: widget.fem,
                            hem: widget.hem,
                            ffem: widget.ffem,
                            onPressed: () {
                              _imageModelBottomSheet(
                                  context, _selectedBackCard);
                            },
                          ),
                  ],
                ),
                errorCard != null
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: 2 * widget.hem,
                          left: 45 * widget.fem,
                        ),
                        child: SizedBox(
                          width: 270 * widget.fem,
                          child: Text(
                            errorCard.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 12 * widget.ffem,
                                fontWeight: FontWeight.normal,
                                height: 1.3625 * widget.ffem / widget.fem,
                                color: Color(0xffba1c1c)),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 5 * widget.hem,
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 10 * widget.hem),
                  child: SizedBox(
                    width: 270 * widget.fem,
                    child: Text(
                      'Hãy tải lên cả mặt trước và mặt sau của thẻ sinh viên, và đảm bảo rằng thông tin trên thẻ đầy đủ và rõ ràng.',
                      style: GoogleFonts.nunito(
                        fontSize: 9 * widget.ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3625 * widget.ffem / widget.fem,
                        color: kLowTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5 * widget.hem,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20 * widget.hem,
          ),
          ButtonSignUp2(
            fem: widget.fem,
            hem: widget.hem,
            ffem: widget.ffem,
            onPressed: () {
              if (_selectedBackCard == null || _selectedFrontCard == null) {
                setState(() {
                  errorCard = 'Thẻ sinh viên không được bỏ trống';
                });
              } else if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, SignUp3Screen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  Future _pickerImageFromGallery(File? selectedImage, context) async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;

    if (selectedImage.hashCode == _selectedFrontCard.hashCode) {
      selectedImage = File(returnedImage.path);

      setState(() {
        _selectedFrontCard = selectedImage;
      });
      Navigator.pop(context);
    } else {
      selectedImage = File(returnedImage.path);

      setState(() {
        _selectedBackCard = selectedImage;
      });
      Navigator.pop(context);
    }
  }

  Future _pickerImageFromCamera(File? selectedImage, context) async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;

    if (selectedImage.hashCode == _selectedFrontCard.hashCode) {
      selectedImage = File(returnedImage.path);

      setState(() {
        _selectedFrontCard = selectedImage;
      });
      Navigator.pop(context);
    } else {
      selectedImage = File(returnedImage.path);

      setState(() {
        _selectedBackCard = selectedImage;
      });
      Navigator.pop(context);
    }
  }

  void _imageModelBottomSheet(context, File? selectedImage) {
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
                    _pickerImageFromCamera(selectedImage, context);
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
                        style: GoogleFonts.nunito(
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
                    _pickerImageFromGallery(selectedImage, context);
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
                        style: GoogleFonts.nunito(
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
