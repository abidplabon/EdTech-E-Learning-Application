

import 'package:dots_indicator/dots_indicator.dart';
import 'package:edtech/common/widgets/text_widgets.dart';
import 'package:edtech/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/dimensions.dart';

class Welcome extends StatefulWidget {
   Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _controller = PageController();

  int dotsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            //margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                  PageView(
                    onPageChanged: (value){
                      setState(() {
                        dotsIndex=value;
                      });
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      //Padding(padding: EdgeInsets.only(top: 1)),
                        appOnboardingPage(
                          _controller,
                            imagePath: "assets/images/reading.png",
                            title: "First see Learning",
                            subTitle:"Forget about the paper, now learning all in one place",
                            index:1,
                            context
                        ),
                      appOnboardingPage(
                        _controller,
                          imagePath: "assets/images/man.png",
                          title: "Connect with Everyone",
                          subTitle:"Always keep updated with newer technology and educational materials",
                          index:2,
                          context
                      ),
                      appOnboardingPage(
                        _controller,
                          imagePath: "assets/images/boy.png",
                          title: "Always Fascinated Learning",
                          subTitle:"Anytime, anywhere. The time is at your discretion. So study wherever you like",
                          index:3,
                          context
                      ),
                    ],
                  ),
                Positioned(
                    child: DotsIndicator(
                      position: dotsIndex,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(24.0,8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)
                        )
                      ),
                    ),
                  bottom: MediaQuery.of(context).size.height/15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
