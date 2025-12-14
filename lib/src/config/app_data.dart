import 'package:loja_app/src/models/cart_item_model.dart';
import 'package:loja_app/src/models/item_model.dart';
import 'package:loja_app/src/models/order_model.dart';
import 'package:loja_app/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [apple, grape, guava, kiwi, mango, papaya];

List<String> categorias = [
  'Início',
  'Promoções',
  'Bebidas',
  'Lanches',
  'Doces',
  'Sobremesas',
  'Café',
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: mango, quantity: 1),
];

UserModel user = UserModel(
  email: 'wladimir@gmail.com',
  name: 'Wladimir Silva Oliveira',
  phone: '38 9 9999-999',
  cpf: '123.456.789-00',
  password: '',
);

List<OrderModel> orders = [
  OrderModel(
    id: '123gfdngmlçfd',
    createdDateTime: DateTime.parse('2025-11-26 20:21'),
    overdueDateTime: DateTime.parse('2025-11-26 21:21'),
    items: [CartItemModel(item: apple, quantity: 2)],
    status: 'pending_payment',
    copyAndPaste: 'jfbdsbfsdkl',
    total: 50.0,
  ),
];
