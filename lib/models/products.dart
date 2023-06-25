import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  int productCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.productCount = 1,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  // Product copyWith({int? productCount}) {
  //   return Product(
  //     id: this.id,
  //     title: this.title,
  //     price: this.price,
  //     description: this.description,
  //     category: this.category,
  //     image: this.image,
  //   //  productCount: productCount ?? this.productCount,
  //   );
  // }
}
