import 'package:edtech/common/values/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration appBoxShadow({Color color =AppColors.primaryElement,}){
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 2,
        offset: const Offset(0,1)
      )
    ]
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius=15,
  Color borderColor = AppColors.primaryFourElementText
}){
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor)
  );
}