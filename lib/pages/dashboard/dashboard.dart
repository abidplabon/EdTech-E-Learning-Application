import 'dart:convert';

import 'package:edtech/pages/dashboard/video_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'card_widget.dart';
import 'colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  Future<void> _initData() async{
    final jsonString = await DefaultAssetBundle.of(context).loadString("json/info.json");
    setState(() {
      info = json.decode(jsonString);
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 90,left: 30,right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text("Courses",
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Text("Your Enrolled Courses",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/images/card.jpg"
                            ),
                            fit: BoxFit.fill
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8,10),
                              color: AppColor.gradientSecond.withOpacity(0.3)
                          )
                        ]
                    ),
                  ),
                  Positioned(
                    left: 40,
                    child: Container(
                      //padding: EdgeInsets.only(left: 120),
                      width: 180,
                      height: 185,
                      decoration: BoxDecoration(
                        //color: Colors.redAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/Programmer.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    child: Container(
                      width: double.maxFinite,
                      height: 100,
                      //color: Colors.redAccent.withOpacity(0.3),
                      margin: const EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("You are doing great",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.homePageDetail
                            ),
                          ),
                          const SizedBox(height: 10,),
                          RichText(text: const TextSpan(
                              text: "Keep it up\n",
                              style: TextStyle(
                                  color: AppColor.homePagePlanColor,
                                  fontSize: 16
                              ),
                              children: [
                                TextSpan(
                                    text: "stick to your plan"
                                )
                              ]
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              children: [
                Text("Ready to Complete?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: AppColor.homePageTitle
                  ),
                )
              ],
            ),
            Expanded(child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: (_,i){
                    return CustomCard(onTap:(){
                      List x = info.where((element) => element["id"]==info[i]["id"]).toList();
                      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
                      print(x);
                      //List selectedList = [];
                      //selectedList.add(x);
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
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
