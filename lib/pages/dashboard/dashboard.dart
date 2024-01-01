import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_widget.dart';
import 'colors.dart';
import 'video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  Future<void> _initData() async {
    final jsonString =
    await DefaultAssetBundle.of(context).loadString("json/info.json");
    setState(() {
      info = json.decode(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DashBoard",
              style: TextStyle(
                fontSize: 30,
                color: AppColor.homePageTitle,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Your Enrolled Courses",
              style: TextStyle(
                fontSize: 20,
                color: AppColor.homePageTitle,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: (_, i) {
                    return CustomCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoInfo(),
                            settings: RouteSettings(
                              arguments: {"id": info[i]["id"].toString()},
                            ),
                          ),
                        );
                      },
                      topImage: info[i]["img"],
                      title: info[i]["title"],
                      subtitle: "By ${info[i]["auth"]}",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
