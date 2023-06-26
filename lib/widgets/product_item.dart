import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Handle product item click
        },
        child: Card(
          color: Colors.amber,
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Price: \$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            final productToAdd = product;
                            context.read<CartCubit>().addToCart(product);
                          },
                          icon: Icon(Icons.shopping_cart)),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            final productToAdd = product;
                            context.read<CartCubit>().addToFav(product);
                          },
                          icon: Icon(Icons.favorite)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
