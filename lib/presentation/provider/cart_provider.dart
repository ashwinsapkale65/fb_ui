import 'package:fb_demo/models/ItemModel.dart';
import 'package:flutter/material.dart';


class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  double total = 0.0;

  List<CartItem> get cartItems => _cartItems;
  double get totalPrice => total;

  void addToCart(Product product) {
    for (CartItem item in _cartItems) {
      if (item.product.id == product.id) {
        item.quantity++;
        total += product.price;
        notifyListeners();
        return;
      }
    }

    _cartItems.add(CartItem(product: product));
    total += product.price;
    notifyListeners();
  }

  void removeFromCart(Product product) {
    for (CartItem item in _cartItems) {
      if (item.product.id == product.id) {
        total -= product.price * item.quantity;
        _cartItems.remove(item);
        notifyListeners();
        return;
      }
    }
  }

  void increment(Product product) {
    for (CartItem item in _cartItems) {
      if (item.product.id == product.id) {
        item.quantity++;
        total += product.price;
        notifyListeners();
        return;
      }
    }
  }

  void decrement(Product product) {
    for (CartItem item in _cartItems) {
      if (item.product.id == product.id) {
        if (item.quantity > 1) {
          item.quantity--;
          total -= product.price;
          notifyListeners();
        } else {
          removeFromCart(product);
        }
        return;
      }
    }
  }
}
