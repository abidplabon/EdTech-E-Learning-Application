import 'package:edtech/common/values/app_colors.dart';
import 'package:edtech/common/widgets/app_shadow.dart';
import 'package:edtech/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_widgets.dart';

Widget thridPartyLogin(){
  return Container(
    margin: const EdgeInsets.only(
      left: 80, right: 80, top: 40, bottom: 20
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath){
  return GestureDetector(
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(imagePath),
    ),
  );
}


