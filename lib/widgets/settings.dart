import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:cicoffee_app/store/reset_password/reset_password_store.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class Settings extends StatefulWidget {
  final authStore = GetIt.instance.get<AuthStore>();
  final resetPasswordStore = GetIt.instance.get<ResetPasswordStore>();

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
      body:Container(

        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 32),
          child: Column(
            children: [
              IntrinsicHeight(
                child:
                    InkWell(
                      onTap: () => {
                        widget.resetPasswordStore.resetPassword(widget.authStore.member.email)
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              child:
                              IconButton(
                                  icon:
                                  Icon(
                                    Icons.restore,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                  }),

                            ),
                            SizedBox(width: 12),
                            Text(
                              "Reset password",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
]),
                    ),
      ),]),),

      ),
    );
  }
}
