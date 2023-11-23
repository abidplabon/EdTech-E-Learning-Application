import 'package:flutter/material.dart';


import 'colors.dart';


class CustomCard extends StatelessWidget {
  final String topImage;
  final String title;
  final String subtitle;
  final int maxTitleLength;
  final Function() onTap;

  const CustomCard({
    Key? key,
    required this.topImage,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.maxTitleLength = 28, // Set your desired maximum length
  }) : super(key: key);

  String truncateTitle() {
    if (title.length <= maxTitleLength) {
      return title;
    } else {
      return title.substring(0, maxTitleLength) + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30),
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage("assets/images/card.jpg"),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  offset: const Offset(8, 10),
                  color: Colors.grey.withOpacity(0.3),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: Container(
              width: 180,
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(topImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            child: Container(
              width: double.maxFinite,
              height: 100,
              margin: const EdgeInsets.only(left: 150, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.homePageDetail,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      text: subtitle,
                      style: const TextStyle(
                        color: AppColor.homePagePlanColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Continue Course >>',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
