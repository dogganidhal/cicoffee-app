import 'package:flutter/material.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:cicoffee_app/store/team/team_store.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get_it/get_it.dart';


class JoinTeam extends StatelessWidget {

  JoinTeam({Key key}) : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController _outputController = new TextEditingController();

  final TeamStore teamStore = GetIt.instance.get<TeamStore>();

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
      ButtonTheme(
        height: 56,
        minWidth: double.infinity,
        child: Padding(
                padding: EdgeInsets.all(24),
                child:

                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).backgroundColor,
                  onPressed: _scanPhoto,
                  child: Text(
                      "Scan QR Code"
                  ),
                ),
                ),
          ),
    ],
  ),
    );
  }

  Future _scanPhoto() async {
    // Parse to code string with uint8list
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      _outputController.text = barcode;
      teamStore.joinTeam(barcode);

    }
  }
}