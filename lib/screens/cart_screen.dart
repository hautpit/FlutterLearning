import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';
import "../widgets/cart_item.dart";

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    "\$${cart.totalAmount}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                  child: Text(
                    "ORDER NOW",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Provider.of<Orders>(
                      context,
                      listen: false,
                    ).addOrder(
                      cart.itemsList,
                      cart.totalAmount,
                    );
                    cart.clear();
                  },
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (ctx, i) => CartItem(
            id: cart.itemsList[i].id,
            productId: cart.items.keys.toList()[i],
            title: cart.itemsList[i].title,
            price: cart.itemsList[i].price,
            quantity: cart.itemsList[i].quantity,
          ),
          itemCount: cart.itemCount,
        ))
      ]),
    );
  }
}
