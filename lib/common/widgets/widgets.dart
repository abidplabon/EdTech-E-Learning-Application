import 'package:edtech/common/values/constants.dart';
import 'package:edtech/common/widgets/app_shadow.dart';
import 'package:edtech/common/widgets/text_widgets.dart';
import 'package:edtech/global.dart';
import 'package:edtech/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

Widget appOnboardingPage(PageController controller, BuildContext context, {String imagePath = "assets/images/reading.png", String title = "", String subTitle = "", int index = 0}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subTitle),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index, duration: const Duration(microseconds: 300), curve: Curves.linear);
      } else {
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
        );
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(text: index < 3 ? "Next" : "Get started", color: Colors.white),
      ),
    ),
  );
}
