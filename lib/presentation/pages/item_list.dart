import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fb_demo/presentation/provider/items_provider.dart';
import 'package:fb_demo/presentation/provider/cart_provider.dart';
import 'package:fb_demo/presentation/widgets/itemcard.dart';
import 'package:fb_demo/presentation/pages/cart_page.dart'; 
class Productlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        title: Text(
          'Product List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, _) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Center(
                  child: Text(
                    'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ProductProvider>(
              builder: (context, productProvider, _) {
                if (productProvider.products.isEmpty) {
                  productProvider.fetchProducts();
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.black,
                    ),
                    itemCount: productProvider.products.length,
                    itemBuilder: (context, index) {
                      final product = productProvider.products[index];
                      return ItemCard(product: product);
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
