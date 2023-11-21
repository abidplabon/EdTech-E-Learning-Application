class SignInState{
  final String email;
  final String password;

  SignInState({
    this.email="",
    this.password="",
  });
  SignInState copyWith({
    String? email,
    String? password,
  }){
    return SignInState(
      email: email??this.email,
      password: password??this.password,
    );
  }
}

// void main(){
//   SignInState state = SignInState();
//   state.email = "a@a.com";
//   SignInState myState = SignInState(email: "A@a.com",password: "123");
//   myState.password="12";
// }