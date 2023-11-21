import 'package:edtech/pages/sign_in/register_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_text_field.dart';
import '../../common/widgets/button_widgets.dart';
import '../../common/widgets/sign_in_widgets.dart';
import '../../common/widgets/text_widgets.dart';


class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regProvider = ref.watch(registerNotifierProvider);
    //regProvider.copyWith();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(text: "Register"),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: text14Normal(
                    text: "Enter your details below and free signup",  ),),
                const SizedBox(height: 50,),
                appTextField(
                    text:"User name",
                    iconName:"assets/icons/user.png",
                    hintText:"Enter your user name",
                    obscureText:false
                ),
                const SizedBox(height: 20,),
                appTextField(
                    text:"Email",
                    iconName:"assets/icons/user.png",
                    hintText:"Enter your email address",
                    obscureText:false
                ),
                const SizedBox(height: 20,),
                appTextField(
                    text:"Password",
                    iconName:"assets/icons/lock.png",
                    hintText:"Enter your email password",
                    obscureText:true
                ),
                const SizedBox(
                  height: 20,
                ),
                appTextField(
                    text:"Confirm Password",
                    iconName:"assets/icons/lock.png",
                    hintText:"Confirm your password",
                    obscureText:true
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: text14Normal(text:"By signing up you are agreeing to all our terms and conditions"),
                ),
                const SizedBox(height: 100,),
                Center(
                  child: appButton(
                      buttonName:"Register",
                      isLogin:true,
                      context: context,
                    func: (){

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
