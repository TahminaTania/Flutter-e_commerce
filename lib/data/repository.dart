import 'dart:convert';

import 'package:e_commerce_app/data/api_clients.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:http/http.dart';

class ProductRepository {
  String userUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getdata() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Product.fromJson(e)).toList();
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
