import 'package:cicoffee_app/store/auth/auth_store.dart';
import 'package:cicoffee_app/store/navigation/navigation_store.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class Welcome extends StatelessWidget {
  final authStore = GetIt.instance.get<AuthStore>();
  final navigationStore = GetIt.instance.get<NavigationStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: ScrollColumnExpandable(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 48,
                    child: Image.asset(Assets.logo),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Pausa Café",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 24),
                child: Text(
                  "Take a coffee break.",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(
                      color: Theme.of(context).textTheme.overline.color,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(
                "Enjoy it with your best colleagues !",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(
                    fontSize: 16
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Image.asset(
                        Assets.coffeeTime
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ButtonTheme(
                  height: 56,
                  minWidth: 164,
                  child: Wrap(
                    spacing: 14,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                        ),
                        color: Theme.of(context).primaryColor.withOpacity(0.15),
                        textColor: Theme.of(context).primaryColor,
                        onPressed: navigationStore.navigateToSignUp,
                        child: Text("Sign up"),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).backgroundColor,
                        onPressed: navigationStore.navigateToLogin,
                        child: Text("Login"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
