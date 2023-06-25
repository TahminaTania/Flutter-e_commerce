import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartState) {
            final cartItems = state.cartItems;

            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];

                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product.title),
                  subtitle:
                      Text('Price: \$${product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context)
                              .decrementCount(product);
                        },
                      ),
                      Text(product.productCount.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context)
                              .incrementCount(product);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context)
                              .removeFromCart(product);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No items in the cart'),
            );
          }
        },
      ),
    );
  }
}
