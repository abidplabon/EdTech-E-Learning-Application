import 'package:edtech/common/values/app_colors.dart';
import 'package:edtech/common/widgets/app_shadow.dart';
import 'package:edtech/common/widgets/text_widgets.dart';
import 'package:edtech/pages/sign_in/sign_in.dart';
import 'package:edtech/pages/sign_in/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appButton({
  double width = 325,
  double height= 50,
  String buttonName = " ",
  bool isLogin = true,
  BuildContext? context,
  void Function()? func
}){
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width,
      height: height,
      decoration: appBoxShadow(
        color: isLogin?AppColors.primaryElement: Colors.white
      ),
      child: Center(
        child: text16Normal(
          text: buttonName,color: isLogin?AppColors.primaryBackground : AppColors.primaryText
        ),
      ),
    ),
  );
}