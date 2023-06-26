import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Page'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartState) {
            final favouriteItems = state.favItems;
            if (favouriteItems.length > 0) {
              return ListView.builder(
                itemCount: favouriteItems.length,
                itemBuilder: (context, index) {
                  final product = favouriteItems[index];

                  return ListTile(
                      leading: Image.network(
                        product.image,
                        width: 70,
                        height: 70,
                      ),
                      title: Text(product.title),
                      subtitle:
                          Text('Price: \$${product.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                          onPressed: () {
                            BlocProvider.of<CartCubit>(context)
                                .removeFav(product);
                          },
                          icon: Icon(Icons.remove_circle_outline_outlined)));
                },
              );
            } else {
              return Center(
                child: Text('No More Items in Favourite'),
              );
            }
          } else {
            return Center(
              child: Text('No items added in Favourite'),
            );
          }
        },
      ),
    );
  }
}
