import 'package:edtech/common/entities/user.dart';
import 'package:edtech/common/global_loader/global_loader.dart';
import 'package:edtech/common/values/constants.dart';
import 'package:edtech/common/values/dimensions.dart';
import 'package:edtech/common/widgets/popup_messages.dart';
import 'package:edtech/global.dart';
import 'package:edtech/pages/dashboard/dashboard.dart';
import 'package:edtech/pages/sign_in/sign_in_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/homePage.dart';


class SignInController{
  WidgetRef ref;
  //String type;
  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if((state.email.isEmpty)|| email.isEmpty){
      toastInfo("Your email is empty");
      return;
    }
    if((state.password.isEmpty)|| password.isEmpty){
      toastInfo("Your password is empty");
      return;
    }
    if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(email)) {
      toastInfo("Enter a valid email address");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
  try{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    if (credential.user == null) {
      toastInfo("User not found");
    }
    if (!credential.user!.emailVerified) {
      toastInfo("You must verify your email address first");
    }
    var user = credential.user;
    if (user != null) {
      String? displayName = user.displayName;
      String? email = user.email;
      String? id = user.uid;
      String? photoUrl = user.photoURL;

      LoginRequestEntity loginRequestEntity = LoginRequestEntity();
      loginRequestEntity.avatar = photoUrl;
      loginRequestEntity.name = displayName;
      loginRequestEntity.email = email;
      loginRequestEntity.open_id = id;
      loginRequestEntity.type = 1;
      asyncPostAllData(loginRequestEntity);
      toastInfo("User Logged In");


  }else{
    toastInfo("Login Error");
  }
    }catch(e){
    if(kDebugMode){
      print(e.toString());
    }
  }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);

    }
    void asyncPostAllData(LoginRequestEntity loginRequestEntity){
      //ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      //ref.read(appLoaderProvider.notifier).setLoaderValue(false);
      //store the login information
      try{
        var navigator = Navigator.of(ref.context);
        Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, "abid15@cse.pstu.ac.bd");
        Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
        navigator.push(
          MaterialPageRoute (
            builder: (BuildContext context) => HomePage(),
          ),
        );
      }catch(e){
        if(kDebugMode){
          print(e.toString());
        }
      }
    }
  }
