import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 200);

//colors
const kPrimaryColor = Color(0xff2ecc71);
const kDarkPrimaryColor = Color(0xff1d4d4f);
const kLowTextColor = Color(0xff989da3);
const kbgWhiteColor = Color(0xfff8f6fb);
const klighGreyColor = Color(0xffececf1);

//strings
const String baseURL = 'https://unibean.azurewebsites.net/api/v1/';

//RegExp
final RegExp emailValidationRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

final RegExp textOnlyPattern = RegExp(r'^[a-zA-Z ]+$');

final RegExp vietNameseTextOnlyPattern = RegExp(
    r'^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$');

final RegExp passwordPattern = RegExp(
  r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
);

final RegExp userNamePattern = RegExp(r'^(?=.*[a-z0-9])[a-z0-9]{5,50}$');