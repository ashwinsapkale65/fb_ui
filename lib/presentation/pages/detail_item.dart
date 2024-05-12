import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fb_demo/models/ItemModel.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String title;

  const DetailScreen({super.key, required this.id, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchSingleProduct(widget.id);
  }

  Future<Product> fetchSingleProduct(int id) async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/$id'));
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      return Product.fromJson(responseData);
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<Product>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        snapshot.data!.thumbnail,
                        scale: 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        snapshot.data!.rating.toInt(),
                        (index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data!.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data!.price.toString() + "\$ ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 30),
                        ),
                      ],
                    ),
                    Text(
                      "min " +
                          snapshot.data!.discountPercentage.toString() +
                          "% off",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 240, 8),
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: snapshot.data!.images.map((imageUrl) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(imageUrl,
                                    width: 100, height: 100),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 30.0),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(255, 159, 0, 1),
                                )),
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () => {}),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 30.0),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(251, 100, 27, 1))),
                            child: Text("Buy Now",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onPressed: () => {})
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87)),
                      width: MediaQuery.of(context).size.height * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              "Product Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            )),
                            Text("Category : " + snapshot.data!.category),
                            Text("Brand : " + snapshot.data!.brand),
                            Text("Description : " + snapshot.data!.description),
                            Text("Stock : " + snapshot.data!.stock.toString())
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
