import 'package:e_commerce_app/Cart/cart_page.dart';
import 'package:e_commerce_app/Globals/responsiveSize.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/favourite/favourite_page.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<ProductCubit>();
      cubit.fetchdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CartPage())));
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => FavouritePage())));
              },
              icon: Icon(Icons.favorite)),
        ],
      )),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadedState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveWidget.isLargeScreen(context)
                    ? 5
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 3
                        : ResponsiveWidget.isSmallScreen(context)
                            ? 2
                            : 4,
                childAspectRatio: ResponsiveWidget.isLargeScreen(context)
                    ? 0.9
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 0.99
                        : ResponsiveWidget.isSmallScreen(context)
                            ? 1.2
                            : 1,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductItem(product: product);
              },
            );
          } else if (state is ProductInitialState ||
              state is ProductState ||
              state is ProductLoadingState) {
            return Container(
              child: Center(
                  child: Column(
                children: [CircularProgressIndicator(), Text(state.toString())],
              )),
            );
          } else {
            return Container(
              child: Text(state.toString()),
            );
          }
        },
      ),
    );
  }
}
