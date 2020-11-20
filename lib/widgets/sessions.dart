import 'package:cicoffee_app/theme/assets.dart';
import 'package:flutter/material.dart';


class Sessions extends StatefulWidget {
  @override
  _SessionsState createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Text("Sessions"),
      ),
    );
  }
}
