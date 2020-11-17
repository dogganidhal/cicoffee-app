import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/widgets/login.dart';
import 'package:cicoffee_app/widgets/scroll_column_expandable.dart';
import 'package:cicoffee_app/widgets/sign_up.dart';
import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
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
                  "Lorem ipsum dolor sit amet.",
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
                "Integer malesuada aliquam congue duis mattis",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                        ),
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                        textColor: Theme.of(context).primaryColor,
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUp()
                        )),
                        child: Text("Sign up"),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).backgroundColor,
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login()
                        )),
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
