import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Product {
  late String name;
  late double price;
  late String image;
  late List<ProductStyle> styles;
  late String title;
  late String description;
  late String category;

  Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.styles,
      required this.title,
      required this.description,
      required this.category});

  String formatPrice() {
    NumberFormat format = NumberFormat('0,000');
    return format.format(price);
  }
}

class ProductStyle {
  late Color color;
  late String image;

  ProductStyle({required this.color, required this.image});
}
