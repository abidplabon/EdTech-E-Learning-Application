import 'package:edtech/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../values/app_colors.dart';

AppBar buildAppbar({String text= ""}){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.white,
        height: 1,
      ),
    ),
    title: text16Normal(text: text, color: AppColors.primaryText),
  );
}