import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([], 0));

  void addToCart(Product product) {
    print("got the addToCart");
    final isItemInCart = state.cartItems.any((item) => item.id == product.id);
    //final updatedProductCount = {...state.productCount};
    if (isItemInCart) {
      return;
    }

    final updatedCartItems = [...state.cartItems, product];
    emit(CartState(updatedCartItems, 1));
  }

  void removeFromCart(Product product) {
    final updatedCartItems = [...state.cartItems];
    final updatedProductCount = 0;
    updatedCartItems.remove(product);
    emit(CartState(updatedCartItems, 1));
  }

  void incrementCount(Product product) {
    final cartItems = List.of(state.cartItems);
    // Find the product in the cart
    final existingProductIndex =
        cartItems.indexWhere((p) => p.id == product.id);
    if (existingProductIndex != -1) {
      cartItems[existingProductIndex].productCount++;
    }

    emit(CartState(cartItems, state.productCount + 1));
  }

  void decrementCount(Product product) {
    final cartItems = List.of(state.cartItems);
    // Find the product in the cart
    final existingProductIndex =
        cartItems.indexWhere((p) => p.id == product.id);
    if (existingProductIndex != -1) {
      if (cartItems[existingProductIndex].productCount > 0) {
        cartItems[existingProductIndex].productCount--;
      }else{
        cartItems.removeAt(existingProductIndex); 
      }
    }
    emit(CartState(cartItems, state.productCount - 1));
  }
}
