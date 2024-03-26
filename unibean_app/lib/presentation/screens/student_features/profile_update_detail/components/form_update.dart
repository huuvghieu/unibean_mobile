import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import '../../../../../domain/repositories.dart';
import '../../../../blocs/blocs.dart';
import 'drop_down_campus.dart';
import 'drop_down_gender.dart';
import 'drop_down_major.dart';
import 'text_form_field_default.dart';

class FormUpdate extends StatefulWidget {
  const FormUpdate({
    super.key,
    required this.ffem,
    required this.fem,
    required this.hem,
    required this.studentModel,
  });

  final double ffem;
  final double fem;
  final double hem;
  final StudentModel studentModel;

  @override
  State<FormUpdate> createState() => _FormBody1State();
}

class _FormBody1State extends State<FormUpdate> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController campusController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool changed = false;
  @override
  void initState() {
    nameController.text = widget.studentModel.fullName;
    campusController.text = widget.studentModel.campusId;
    if (widget.studentModel.gender == 'Female') {
      genderController.text = '1';
    } else {
      genderController.text = '2';
    }
    majorController.text = widget.studentModel.majorId;
    addressController.text = widget.studentModel.address;

    nameController.addListener(() => setState(() {
          changed = true;
        }));
    campusController.addListener(() => setState(() {
          changed = true;
        }));
    genderController.addListener(() => setState(() {
          changed = true;
        }));
    majorController.addListener(() => setState(() {
          changed = true;
        }));
    addressController.addListener(() => setState(() {
          changed = true;
        }));
    super.initState();
  }
  // var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state is StudentUpdateSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              elevation: 0,
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Sửa thành công',
                message: 'Cập nhật thông tin mới thành công!',
                contentType: ContentType.success,
              ),
            ));
          Navigator.pop(context);
        } else if (state is StudentFaled) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              elevation: 0,
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Sửa thất bại',
                message: 'Cập nhật thông tin thất bại!',
                contentType: ContentType.failure,
              ),
            ));
          Navigator.pop(context);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  right: 15 * widget.fem, left: 15 * widget.fem),
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
                  TextFormFieldDefault(
                    hem: widget.hem,
                    fem: widget.fem,
                    ffem: widget.ffem,
                    labelText: 'HỌ VÀ TÊN',
                    hintText: 'Nhập họ và tên...',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Họ và tên không được bỏ trống';
                      } else if (!vietNameseTextOnlyPattern.hasMatch(value)) {
                        return 'Họ và tên không hợp lệ';
                      }
                      return null;
                    },
                    textController: nameController,
                  ),
                  SizedBox(
                    height: 25 * widget.hem,
                  ),
                  DropDownMajor(
                    hem: widget.hem,
                    fem: widget.fem,
                    ffem: widget.ffem,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Chuyên ngành không được bỏ trống';
                      }
                      return null;
                    },
                    labelText: 'CHUYÊN NGÀNH',
                    hintText: 'Chọn chuyên ngành',
                    majorController: majorController,
                    majorId: widget.studentModel.majorId,
                  ),
                  SizedBox(
                    height: 25 * widget.hem,
                  ),
                  BlocProvider(
                    lazy: false,
                    create: (context) =>
                        CampusBloc(context.read<CampusRepository>())
                          ..add(LoadCampus(
                              universityId: widget.studentModel.universityId)),
                    child: BlocBuilder<CampusBloc, CampusState>(
                      builder: (context, state) {
                        if (state is CampusLoaded) {
                          return DropDownCampus(
                            fem: widget.fem,
                            hem: widget.hem,
                            ffem: widget.ffem,
                            hintText: 'Chọn cơ sở',
                            labelText: 'CƠ SỞ',
                            campusController: campusController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Cơ sở không được bỏ trống';
                              }
                              return null;
                            },
                            campusId: widget.studentModel.campusId,
                            campuses: state.campuses,
                          );
                        }
                        return Center(
                            child: CircularProgressIndicator(
                                color: kPrimaryColor));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25 * widget.hem,
                  ),
                  DropDownGender(
                    fem: widget.fem,
                    hem: widget.hem,
                    ffem: widget.ffem,
                    hintText: 'Chọn giới tính',
                    labelText: 'GIỚI TÍNH',
                    genderController: genderController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Giới tính không được bỏ trống';
                      }
                      return null;
                    },
                    genderName: widget.studentModel.gender,
                  ),
                  SizedBox(
                    height: 25 * widget.hem,
                  ),
                  TextFormFieldDefault(
                    hem: widget.hem,
                    fem: widget.fem,
                    ffem: widget.ffem,
                    labelText: 'ĐỊA CHỈ',
                    hintText: 'Nhập địa chỉ...',
                    validator: (value) {
                      return null;
                    },
                    textController: addressController,
                  ),
                  SizedBox(
                    height: 25 * widget.hem,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25 * widget.hem,
            ),
            buttonWidget(changed, context)
          ],
        ),
      ),
    );
  }

  Widget buttonWidget(changed, BuildContext context) {
    if (changed) {
      return TextButton(
        onPressed: () {
          context.read<StudentBloc>().add(UpdateStudent(
              studentId: widget.studentModel.id,
              fullName: nameController.text,
              majorId: majorController.text,
              campusId: campusController.text,
              address: addressController.text,
              gender: int.parse(genderController.text)));
        },
        child: Container(
            width: 220 * widget.fem,
            height: 45 * widget.hem,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(23 * widget.fem)),
            child: BlocBuilder<StudentBloc, StudentState>(
              builder: (context, state) {
                if (state is StudentUpding) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                } else {
                  return Center(
                    child: Text(
                      'Lưu thông tin',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 17 * widget.ffem,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  );
                }
              },
            )),
      );
    } else {
      return TextButton(
        onPressed: () {},
        child: Container(
            width: 220 * widget.fem,
            height: 45 * widget.hem,
            decoration: BoxDecoration(
                color: kLowTextColor,
                borderRadius: BorderRadius.circular(23 * widget.fem)),
            child: Center(
              child: Text(
                'Lưu thông tin',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 17 * widget.ffem,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
            )),
      );
    }
  }
}
