import 'package:flutter/material.dart';
import 'package:proj_roupas/components/appDrawer_components.dart';
import 'package:proj_roupas/components/order_components.dart';
import 'package:proj_roupas/models/order_list_model.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
        )
    );
  }
}