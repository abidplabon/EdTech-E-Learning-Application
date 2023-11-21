import 'package:edtech/common/entities/user.dart';
import 'package:edtech/common/global_loader/global_loader.dart';
import 'package:edtech/common/widgets/popup_messages.dart';
import 'package:edtech/pages/sign_in/sign_in_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    }catch(e){}
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);

    }
    void asyncPostAllData(LoginRequestEntity loginRequestEntity){
      //ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      //ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
