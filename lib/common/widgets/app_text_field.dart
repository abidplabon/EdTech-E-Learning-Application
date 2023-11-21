import 'package:edtech/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField({
  String text="",
  String iconName="",
  String hintText = "Type your information",
  bool obscureText = false,
  void Function(String value)? func
}){
  return Container(
    padding: const EdgeInsets.only(top:15,left: 25,right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        Container(
          width: 430,
          height: 50,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin:const EdgeInsets.only(left: 27),
                child: appImage(imagePath:iconName),
              ),
              Container(
                width: 280,
                height: 50,
                child: TextField(
                  onChanged: (value)=>func!(value),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      )
                  ),

                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}