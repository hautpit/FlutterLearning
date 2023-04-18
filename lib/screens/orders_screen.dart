import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import "../widgets/order_item.dart";

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(
          order: ordersData.orders[i],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
