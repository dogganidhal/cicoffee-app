import 'package:cicoffee_app/theme/assets.dart';
import 'package:flutter/material.dart';


class Hubs extends StatefulWidget {
  @override
  _HubsState createState() => _HubsState();
}

class _HubsState extends State<Hubs> {
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
        child: Text("Hubs"),
      ),
    );
  }
}
