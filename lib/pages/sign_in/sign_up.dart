import 'package:edtech/common/global_loader/global_loader.dart';
import 'package:edtech/common/values/app_colors.dart';
import 'package:edtech/pages/sign_in/register_notifier.dart';
import 'package:edtech/pages/sign_in/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_text_field.dart';
import '../../common/widgets/button_widgets.dart';
import '../../common/widgets/sign_in_widgets.dart';
import '../../common/widgets/text_widgets.dart';


class Signup extends ConsumerStatefulWidget{
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    //regProvider.copyWith();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(text: "Register"),
          backgroundColor: Colors.white,
          body: loader == false?SingleChildScrollView(
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
                    obscureText:false,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserNameChange(value),
                ),
                const SizedBox(height: 20,),
                appTextField(
                    text:"Email",
                    iconName:"assets/icons/user.png",
                    hintText:"Enter your email address",
                    obscureText:false,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserEmailChange(value),
                ),
                const SizedBox(height: 20,),
                appTextField(
                    text:"Password",
                    iconName:"assets/icons/lock.png",
                    hintText:"Enter your email password",
                    obscureText:true,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserPasswordChange(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                appTextField(
                    text:"Confirm Password",
                    iconName:"assets/icons/lock.png",
                    hintText:"Confirm your password",
                    obscureText:true,
                  func: (value)=>ref.read(registerNotifierProvider.notifier).onUserrePasswordChange(value),
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
                    func: ()=>_controller.handleSignUp()
                  ),
                )
              ],
            ),
          ):const Center(child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            color: AppColors.primaryElement,
          ),),
        ),
      ),
    );
  }
}
