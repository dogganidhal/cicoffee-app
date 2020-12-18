import 'package:flutter/material.dart';
import 'package:cicoffee_app/api/client/api_client.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:cicoffee_app/store/participant_order/participant_order_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get_it/get_it.dart';


class ProductCart extends StatelessWidget {

  ProductCart({Key key}) : super(key: key);

  final GlobalKey productKey = GlobalKey();
  final ParticipantOrderStore participantOrderStore = GetIt.instance.get<ParticipantOrderStore>();


  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar:
            AppBar(
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
    body: Observer(
       builder: (context) {
     return ListView.separated(
         padding: EdgeInsets.all(12),
         itemBuilder: (context, index) => Text(participantOrderStore.products[index].name),
         separatorBuilder: (context, _) => SizedBox(height: 12),
         itemCount: participantOrderStore.products.length
     );
   }
    ),
    );
  }
}