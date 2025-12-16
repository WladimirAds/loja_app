import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:loja_app/src/config/app_data.dart' as appData;
import 'package:loja_app/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedidos')),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => OrderTile(order: appData.orders[index]),

        separatorBuilder: (_, index) => SizedBox(height: 10),
        itemCount: appData.orders.length,
      ),
    );
  }
}
