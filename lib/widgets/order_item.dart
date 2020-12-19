import 'package:flutter/material.dart';
import 'package:cicoffee_app/api/dto/order_dto.dart';

class OrderItem extends StatelessWidget {

  final OrderDto order;

  const OrderItem({
    Key key, this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 10, top: 10),
          child:
            Wrap(
              direction: Axis.vertical,
              children: order.items
                  .map((actionChip) => ActionChip(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                avatar: CircleAvatar(backgroundImage: NetworkImage(actionChip.product.photoUrl),),
                backgroundColor: Colors.grey[200],
                label: Text(actionChip.product.name + ' x' + actionChip.quantity.toString()),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                onPressed: () => {},
              )
              )
                  .toList(),
            ),

        ),
      ],
    );
  }


}