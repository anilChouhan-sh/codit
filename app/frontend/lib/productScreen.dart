import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/drawer.dart';
import 'package:frontend/model/product.dart';
import 'package:frontend/url.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];

  Future<void> getProducts() async {
    Future<dynamic> f = http.read(Uri.parse(Variable.URL));

    f.then((value) {
      // print(jsonDecode(value));
      List<dynamic> resp = jsonDecode(value);
      products = resp.map((e) {
        print(e.runtimeType);
        return Product.fromJson(json: e);
      }).toList();
      // print(products);
    }).whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> json = [
    //   {"id": 0, "name": "default", "price": 34, "categories": []},
    //   {"id": 1, "name": "spoon", "price": 45, "categories": []}
    // ];

    // json.map((e) => Product.fromJson(json: e)).toList();

    getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Column(
                children: [
                  Text("Name : ${products[index].name}"),
                  Text("Price : ${products[index].price}"),
                  Text(
                      "Category : ${products[index].categories.length == 0 ? "None" : products[index].categories.toString()}")
                ],
              ));
            }),
      ),
    );
  }
}
