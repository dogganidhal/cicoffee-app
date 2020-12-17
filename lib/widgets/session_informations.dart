import 'package:flutter/material.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:get_it/get_it.dart';
import 'package:cicoffee_app/store/session_details/session_details_store.dart';


class InfoSession extends StatelessWidget {

  InfoSession({Key key}) : super(key: key);
  final SessionDetailsStore sessionDetailsStore = GetIt.instance.get<SessionDetailsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5
                    .copyWith(
                    color: Theme
                        .of(context)
                        .primaryColorDark,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.asset(
                Assets.qrCode,
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future _scanPhoto() async {

  }
}