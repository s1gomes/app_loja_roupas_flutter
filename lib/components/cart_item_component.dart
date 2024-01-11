import 'package:flutter/material.dart';
import 'package:proj_roupas/models/cart_item_model.dart';
import 'package:proj_roupas/models/cart_model.dart';
import 'package:proj_roupas/models/product_list_model.dart';
import 'package:proj_roupas/models/product_model.dart';
import 'package:provider/provider.dart';

class CartItemComponent extends StatelessWidget {
  const CartItemComponent({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Color.fromARGB(255, 255, 255, 255),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text('${cartItem.price}'),
            ),
          )),
          title: Text(cartItem.name),
          subtitle: Text('Total: R\$: ${cartItem.price * cartItem.quantity}'),
          trailing: Text('${cartItem.quantity}x'),
        ),
      ),
    );
  }
}
