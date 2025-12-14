import 'package:flutter/material.dart';
import 'package:loja_app/src/models/cart_item_model.dart';
import 'package:loja_app/src/pages/commom_widgets/quantity_widget.dart';
import 'package:loja_app/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel cartItem) remove;
  final VoidCallback update;
  const CartTile({
    super.key,
    required this.cartItem,
    required this.remove,
    required this.update,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        // Imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          width: 60,
          height: 60,
        ),

        // Título
        title: Text(
          widget.cartItem.item.itemName,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),

        // Subtítulo
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),

        // Quantidade
        trailing: QuantityWidget(
          value: widget.cartItem.quantity,
          sufxText: widget.cartItem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              widget.update();

              if (quantity == 0) {
                // Remover item do carrinho
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
