import 'package:edtech/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';
class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String text;
  final String iconName;
  final String hintText;
  final void Function(String value)? func;

  const PasswordFieldWidget({
    Key? key,
    this.controller,
    this.text = "",
    this.iconName = "",
    this.hintText = "Type your information",
    this.func,
  }) : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text14Normal(text: widget.text),
          Container(
            width: 430,
            height: 50,
            decoration: appBoxDecorationTextField(),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 27),
                  child: appImage(imagePath: widget.iconName),
                ),
                Container(
                  width: 280,
                  height: 50,
                  child: TextField(
                    controller: widget.controller,
                    onChanged: (value) => widget.func!(value),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: !isPasswordVisible,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
