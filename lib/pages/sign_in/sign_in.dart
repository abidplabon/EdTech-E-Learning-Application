import 'package:edtech/pages/sign_in/sign_up.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_text_field.dart';
import '../../common/widgets/button_widgets.dart';
import '../../common/widgets/sign_in_widgets.dart';
import '../../common/widgets/text_widgets.dart';


class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(text: "Login"),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thridPartyLogin(),
                  Center(
                    child: text14Normal(
                      text: "Or use your email account to Login",  ),),
                      const SizedBox(height: 50,),
                  appTextField(
                    text:"Email",
                    iconName:"assets/icons/user.png",
                    hintText:"Enter your email address",
                    obscureText:false
                  ),
                  appTextField(
                      text:"Password",
                      iconName:"assets/icons/lock.png",
                      hintText:"Enter your email password",
                      obscureText:true
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: textUnderline(text:"Forgot Password"),
                  ),
                  const SizedBox(height: 100,),
                  Center(
                    child: appButton(
                      buttonName: "Login"
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: appButton(
                      buttonName:"Register",
                      isLogin:false,
                      context: context,
                      func: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute (
                            builder: (BuildContext context) => const Signup(),
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}
