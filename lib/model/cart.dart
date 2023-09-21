import 'package:ecshop_techpit/model/data/cart_item/cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef Cart = List<CartItem>;

final cartProvider = StateNotifierProvider<CartNotifier, Cart>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier() : super([]);

  void addItem(String id, String option) {
    state = [...state, CartItem(itemId: id, option: option, count: 1)];
    print(state);
  }
}
