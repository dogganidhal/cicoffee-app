import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class AuthLoader extends StatefulWidget {
  @override
  _AuthLoaderState createState() => _AuthLoaderState();
}

class _AuthLoaderState extends State<AuthLoader> {
  final authStore = GetIt.instance.get<AuthStore>();

  @override
  void initState() {
    super.initState();
    authStore.loadFromDisk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}
