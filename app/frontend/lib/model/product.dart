import 'package:flutter/foundation.dart';
import './category.dart' as cat;

class Product {
  int id;
  String name;
  int price;
  List<dynamic> categories;

  Product(
      {required this.id,
      required this.price,
      required this.name,
      required this.categories});

  factory Product.fromJson({required Map<String, dynamic> json}) {
    return Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        categories: json['category']);
  }
}
