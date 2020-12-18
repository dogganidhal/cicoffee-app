import 'package:flutter/material.dart';
import 'package:cicoffee_app/theme/assets.dart';
import 'package:cicoffee_app/api/dto/product_dto.dart';
import 'package:cicoffee_app/api/dto/create_order_dto.dart';
import 'package:cicoffee_app/store/participant_order/participant_order_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:cicoffee_app/api/client/api_client.dart';


class ProductCart extends StatelessWidget {

  ProductCart({Key key}) : super(key: key){
    participantOrderStore.loadOrderItems();
  }

  final GlobalKey productKey = GlobalKey();
  final ParticipantOrderStore participantOrderStore = GetIt.instance.get<ParticipantOrderStore>();
  final ApiClient apiClient = GetIt.instance.get<ApiClient>();


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
         itemBuilder: (context, index) => _orderItems(context, participantOrderStore.products[index]),
         separatorBuilder: (context, _) => SizedBox(height: 12),
         itemCount: participantOrderStore.loading ? 0 : participantOrderStore.products.length,
     );
   }
    ),
    bottomNavigationBar: BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 4.0,
    child:
      ButtonTheme(
        child: Padding(
          padding: EdgeInsets.all(5),
          child:

          FlatButton(
            height: 40,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
            ),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).backgroundColor,
            onPressed: () {
              apiClient.sessions.order(CreateOrderDto(items: participantOrderStore.orderItems));
              Navigator.pop(context);
            },
            child: Text(
                "Order"
            ),
          ),
        ),
      ),

    ),

   );
  }

  Widget _orderItems(BuildContext context, ProductDto product) => Container(
    decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(24),
    ),
    child:
    Padding(
      padding: EdgeInsets.all(16),
      child:
      Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(2)
                  ),
                ),
                SizedBox(width: 12),
                Flexible(
                  fit: FlexFit.tight,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style:
                        Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12),
                      /*
                      Container(
                        margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Colors.blue.shade200,
                            image: DecorationImage(
                                image:  NetworkImage(product.photoUrl)
                            )
                       ),
                      ),
                      */
                    ],
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
            participantOrderStore.orderItems.any((element) => element.productId == product.id) ? participantOrderStore.orderItems.firstWhere((element) => element.productId == product.id).quantity.toString(): "0",
            style:  TextStyle(
                fontSize: 16,
                fontFamily: "Helvetica",
                color: Colors.black,
                fontWeight: FontWeight.w600)
                .copyWith(fontSize: 18, color:Theme.of(context).primaryColor),
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
  );}