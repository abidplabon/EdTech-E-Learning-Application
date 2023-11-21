import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:edtech/pages/sign_in/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier{
  @override
  RegisterState build(){
    return RegisterState();
  }
  void onUserNameChange(String name){
    state = state.copyWith(username:name);
  }
  void onUserEmailChange(String email){
    state = state.copyWith(email:email);
  }
  void onUserChange(String email){
    state = state.copyWith(email:email);
  }
  void onUserPasswordChange(String password){
    state = state.copyWith(password:password);
  }
  void onUserrePasswordChange(String password){
    state = state.copyWith(rePassword:password);
  }
}