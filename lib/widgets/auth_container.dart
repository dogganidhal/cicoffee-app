import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:cicoffee_app/widgets/auth.dart';
import 'package:cicoffee_app/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class AuthContainer extends StatelessWidget {

  final authStore = AuthStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Scaffold(
          body: authStore.member != null ?
            Home() :
            Auth(),
        )
    );
  }

}
