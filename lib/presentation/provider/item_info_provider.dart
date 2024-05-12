import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fb_demo/models/ItemModel.dart';

class DetailProvider extends ChangeNotifier {
  late Product? _product;

  Product? get product => _product;

  Future<void> fetchProductDetails(int id) async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/$id'));
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      _product = Product.fromJson(responseData);
      notifyListeners();
    } else {
      throw Exception('Failed to load product');
    }
  }
}
