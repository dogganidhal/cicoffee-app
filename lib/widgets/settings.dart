import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class Settings extends StatefulWidget {
  final authStore = GetIt.instance.get<AuthStore>();

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => widget.authStore.logout()
          )
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 32,
              child: Image.asset(Assets.logo),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Pausa Café",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
