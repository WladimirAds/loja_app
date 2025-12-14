import 'package:flutter/material.dart';
import 'package:loja_app/src/models/cart_item_model.dart';
import 'package:loja_app/src/pages/cart/components/cart_tile.dart';
import 'package:loja_app/src/pages/commom_widgets/payment_dialog.dart';
import 'package:loja_app/src/services/utils_services.dart';
import 'package:loja_app/src/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);

      utilsServices.showToast(
        message: '${cartItem.item.itemName} removido(a) do carrinho.',
      );
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemFromCart,
                  update: () {
                    setState(() {});
                  },
                );
              },
            ),
          ),

          // Total geral
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total geral',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 13),
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmationDialog();
                      if (result ?? false) {
                        // Lógica para concluir o pedido pode ser adicionada aqui
                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (_) {
                            return PaymentDialog(order: appData.orders.first);
                          },
                        );
                      } else {
                        utilsServices.showToast(
                          message: 'Pedido não confirmado.',
                        );
                      }
                    },
                    child: Text(
                      'Concluir pedido',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.of(context).pop(true);
                // Lógica para concluir o pedido pode ser adicionada aqui
              },
              child: Text('Confirmar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
