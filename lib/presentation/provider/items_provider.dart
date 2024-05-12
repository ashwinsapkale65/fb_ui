import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fb_demo/models/ItemModel.dart';

class ProductProvider extends ChangeNotifier {
  late List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['products'];
      _products = responseData.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
