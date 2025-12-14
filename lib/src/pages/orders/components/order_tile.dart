import 'package:flutter/material.dart';
import 'package:loja_app/src/models/cart_item_model.dart';
import 'package:loja_app/src/models/order_model.dart';
import 'package:loja_app/src/pages/commom_widgets/payment_dialog.dart';
import 'package:loja_app/src/pages/orders/components/order_status_widget.dart';
import 'package:loja_app/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({super.key, required this.order});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: ${order.id}',
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // Lista de produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children:
                            order.items.map((orderItem) {
                              return _OrderItemWidget(
                                utilsServices: utilsServices,
                                orderItem: orderItem,
                              );
                            }).toList(),
                      ),
                    ),
                  ),

                  //Divisão vertical
                  VerticalDivider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                    width: 8,
                  ),
                  // Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            // Total Geral
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 20),
                children: [
                  TextSpan(
                    text: 'Total: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: utilsServices.priceToCurrency(order.total)),
                ],
              ),
            ),

            // Botão Pagamento
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(order: order);
                    },
                  );
                },
                icon: const Icon(Icons.pix, color: Colors.white),
                label: const Text(
                  'Ver QR Code Pix',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    required this.utilsServices,
    required this.orderItem,
  });

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice())),
        ],
      ),
    );
  }
}
