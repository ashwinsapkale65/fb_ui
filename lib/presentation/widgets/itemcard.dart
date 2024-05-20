
import 'package:fb_demo/models/ItemModel.dart';
import 'package:fb_demo/presentation/pages/detail_item.dart';
import 'package:fb_demo/presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  const ItemCard({super.key, required this.product});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.grey.shade50,
      title: Text(
        widget.product.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "min ${widget.product.discountPercentage}% off",
        style: TextStyle(color: Colors.green),
      ),
      leading: Image.network(
        widget.product.thumbnail,
        width: 100,
        height: 100,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: widget.product.id,
              title: widget.product.title,
            ),
          ),
        );
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addToCart(widget.product);
            },
          ),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
