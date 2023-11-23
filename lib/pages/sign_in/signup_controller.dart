import 'package:firebase_auth/firebase_auth.dart';
import 'package:edtech/common/global_loader/global_loader.dart';
import 'package:edtech/common/widgets/popup_messages.dart';
import 'package:edtech/pages/sign_in/register_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpController{
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if(state.username.isEmpty|| name.isEmpty){
      toastInfo("Your name is Empty");
      return;
    }
    if(state.username.length<6|| name.length<6){
      toastInfo("Your name is too Short");
      return;
    }
    if(state.email.isEmpty|| email.isEmpty){
      toastInfo("Your email is Empty");
      return;
    }
    if(state.password.isEmpty!=state.rePassword.isEmpty){
      toastInfo("Your Password does not EXIST");
      return;
    }
    if(state.password!=state.rePassword){
      toastInfo("Your Password does not match");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email,password:password);
      if(kDebugMode){
        print(credential);
      }
      if(credential.user!=null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);

        toastInfo("As verification email is sent, Please open that email account to check and confirm");
        context.pop();
        ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
      }
    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
      ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}