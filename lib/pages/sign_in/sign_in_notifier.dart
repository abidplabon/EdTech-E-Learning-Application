import 'package:edtech/pages/sign_in/signin_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super(SignInState());

  void onUserEmailChange(String email){
    state = state.copyWith(email:email);
  }
  void onUserPasswordChange(String password){
    state = state.copyWith(password:password);
  }
}
final signInNotifierProvider = StateNotifierProvider<SignInNotifier,SignInState>((ref)=>SignInNotifier()
);