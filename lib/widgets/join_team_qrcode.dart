import 'package:flutter/material.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:cicoffee_app/store/team/team_store.dart';
import 'package:get_it/get_it.dart';


class ScanPhoto extends StatefulWidget {
  @override
  _ScanPhoto createState() => new _ScanPhoto();
}
class _ScanPhoto extends State<ScanPhoto> {
  String barCode = "";
  @override
  void initState(){
    super.initState();
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

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
    try{
      ScanResult scanResult= await BarcodeScanner.scan();
      String barCode = scanResult.rawContent;
      setState(() {
        this.barCode = barCode;
      });
      teamStore.joinTeam(barCode);
      Navigator.pop(context);

    } catch(e) {
      setState(() {
        this.barCode = 'Unknown error';
      });
    }
  }
}
