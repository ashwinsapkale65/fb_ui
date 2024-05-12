import 'package:fb_demo/models/ItemModel.dart';
import 'package:fb_demo/presentation/pages/detail_item.dart';
import 'package:flutter/material.dart';

class itemcard extends StatefulWidget {
  final Product product;
  const itemcard({super.key, required this.product});

  @override
  State<itemcard> createState() => _itemcardState();
}

class _itemcardState extends State<itemcard> {
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
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
