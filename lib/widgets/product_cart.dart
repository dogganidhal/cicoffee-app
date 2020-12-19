import 'dart:convert';
import 'dart:typed_data';

import 'package:cicoffee_app/store/session_details/session_details_store.dart';
import 'package:flutter/material.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/api/dto/product_dto.dart';
import 'package:cicoffee_app/store/participant_order/participant_order_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


class ProductCart extends StatelessWidget {
  final String sessionId;
  final GlobalKey productKey = GlobalKey();
  final ParticipantOrderStore participantOrderStore =
  GetIt.instance.get<ParticipantOrderStore>();
  final SessionDetailsStore sessionDetailsStore =
  GetIt.instance.get<SessionDetailsStore>();

  ProductCart({Key key, this.sessionId}) : super(key: key) {
    participantOrderStore.loadProducts();
  }

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
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: Observer(builder: (context) {
        return ListView.separated(
          padding: EdgeInsets.all(12),
          itemBuilder: (context, index) =>
              _product(context, participantOrderStore.products[index]),
          separatorBuilder: (context, _) => SizedBox(height: 12),
          itemCount: participantOrderStore.loading
              ? 0
              : participantOrderStore.products.length,
        );
      }),
      bottomNavigationBar: ButtonTheme(
        height: 56,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).backgroundColor,
            onPressed: () async {
              await participantOrderStore.order(sessionId);
              sessionDetailsStore.loadParticipants(sessionId);
              Navigator.pop(context);
            },
            child: Text("Order"),
          ),
        ),
      ),
    );
  }

  Widget _product(BuildContext context, ProductDto product) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 56,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                          child: Image.network(product.photoUrl)
                      )
                    ),
                    SizedBox(width: 12),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.remove,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {
                          participantOrderStore.removeItem(product);
                        }),
                    Container(
                      padding: EdgeInsets.only(right: 6, left: 6),
                      child: Text(
                        participantOrderStore.orderItems.any(
                                (element) => element.productId == product.id)
                            ? participantOrderStore.orderItems
                                .firstWhere((element) =>
                                    element.productId == product.id)
                                .quantity
                                .toString()
                            : "0",
                        style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Helvetica",
                                color: Colors.black,
                                fontWeight: FontWeight.w600)
                            .copyWith(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.add,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {
                          participantOrderStore.addItem(product);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
