import 'package:cicoffee_app/widgets/login.dart';
import 'package:cicoffee_app/widgets/sign_up.dart';
import 'package:flutter/material.dart';


enum _AuthType {
  LOGIN,
  SIGN_UP
}

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}


class _AuthState extends State<Auth> {
  _AuthType _authType = _AuthType.LOGIN;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kTabScrollDuration,
      child: _authType == _AuthType.LOGIN ?
        Login(
          onSignUpTapped: () {

          },
        ) :
        SignUp(
          onLoginTapped: () {

          },
        ),
    );
  }
}
