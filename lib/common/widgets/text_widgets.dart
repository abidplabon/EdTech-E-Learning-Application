import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_colors.dart';

Widget text24Normal({String text = "" }){
  return Text(text,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontSize: 24,
        color : AppColors.primaryText,
        fontWeight: FontWeight.normal
    ),
  );
}

Widget text16Normal({String text = "", Color color = AppColors.primarySecondaryElementText }){
  return Text(text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.normal
    ),
  );
}

Widget text14Normal({
  String text=" ",
  Color color = AppColors.primaryElementText}){
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(color: color, fontSize: 14,fontWeight: FontWeight.normal),
  );
}

Widget textUnderline({String text="Your text"}){
  return GestureDetector(
    onTap: (){},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText
      ),
    ),
  );
}