import 'package:e_commerce_app/Cart/cart_page.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/screens/products_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateControl extends StatefulWidget {
  const StateControl({Key? key}) : super(key: key);

  @override
  _StateControlState createState() => _StateControlState();
}

class _StateControlState extends State<StateControl> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductInitialState || state is ProductLoadingState) {
          return Container(
            child: Center(child: ProductsListScreen()),
          );
        } else if (state is ProductLoadedState) {
          return ProductsListScreen();
        } else {
          return Container(
            child: Text(state.toString()),
          );
        }
      },
    );
  }
}
