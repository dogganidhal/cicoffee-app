import 'package:cicoffee_app/api/dto/team_dto.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cicoffee_app/theme/assets.dart';

class InvitationQRGenerator extends StatelessWidget {
  final String teamId;

  InvitationQRGenerator({Key key, @required this.teamId}) : super(key: key);

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
      body: Padding(
        padding: EdgeInsets.only(top: 70),
        child:  Column(
                  children: [
                    Center(
                      child: Text(
                        "Scan QR Code to join the team",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: QrImage(
                          data: teamId,
                          gapless: true,
                          size: 320,
                          foregroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
    );
  }

}