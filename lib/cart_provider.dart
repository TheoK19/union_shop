import 'package:flutter/material.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);
  }

  void addItem(Product product) {
    final existingItemIndex = _items.indexWhere((item) => item.product.name == product.name);

    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }

    notifyListeners();
  }

  void removeItem(String productName) {
    _items.removeWhere((item) => item.product.name == productName);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
