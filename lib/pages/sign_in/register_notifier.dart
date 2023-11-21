import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:edtech/pages/sign_in/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier{
  @override
  RegisterState build(){
    return RegisterState();
  }
}