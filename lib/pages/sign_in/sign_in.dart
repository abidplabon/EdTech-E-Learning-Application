import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_text_field.dart';
import '../../common/widgets/button_widgets.dart';
import '../../common/widgets/text_widgets.dart';
import 'package:edtech/common/global_loader/global_loader.dart';
import 'package:edtech/pages/sign_in/sign_in_controller.dart';
import 'package:edtech/pages/sign_in/sign_in_notifier.dart';
import 'package:edtech/pages/sign_in/sign_up.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;
  bool isPasswordVisible = false;

  @override
  void initState() {
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(text: "Login"),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: text14Normal(
                    text: "Or use your email account to Login",
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/15,),
                appTextField(
                  controller: _controller.emailController,
                  text: "Email",
                  iconName: "assets/icons/user.png",
                  hintText: "Enter your email address",
                  obscureText: false,
                  func: (value) =>
                      ref.read(signInNotifierProvider.notifier).onUserEmailChange(value),
                ),
                appTextField(
                  controller: _controller.passwordController,
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Enter your email password",
                  obscureText: true,
                  func: (value) =>
                      ref.read(signInNotifierProvider.notifier).onUserPasswordChange(value),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/16,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: textUnderline(text: "Forgot Password"),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/76,),
                Center(
                  child: appButton(
                      buttonName: "Login", func: () => _controller.handleSignIn()),
                ),
                SizedBox(height:MediaQuery.of(context).size.height/76,),
                Center(
                  child: appButton(
                    buttonName: "Register",
                    isLogin: false,
                    context: context,
                    func: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Signup(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
              : const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              color: AppColors.primaryElement,
            ),
          ),
        ),
      ),
    );
  }
}
