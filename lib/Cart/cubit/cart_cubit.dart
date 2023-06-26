import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([], 0, []));

  void addToCart(Product product) {
    print("got the addToCart");
    final isItemInCart = state.cartItems.any((item) => item.id == product.id);
    if (isItemInCart) {
      return;
    }

    final updatedCartItems = [...state.cartItems, product];
    final favItems = [...state.favItems];
    emit(CartState(updatedCartItems, 1, favItems));
  }

  void removeFromCart(Product product) {
    final updatedCartItems = [...state.cartItems];
    final updatedProductCount = 0;
    updatedCartItems.remove(product);
    final favItems = [...state.favItems];
    emit(CartState(updatedCartItems, 1, favItems));
  }

  void incrementCount(Product product) {
    final cartItems = List.of(state.cartItems);
    final favItems = [...state.favItems];
    final existingProductIndex =
        cartItems.indexWhere((p) => p.id == product.id);
    if (existingProductIndex != -1) {
      cartItems[existingProductIndex].productCount++;
    }

    emit(CartState(cartItems, state.productCount + 1, favItems));
  }

  void decrementCount(Product product) {
    final cartItems = List.of(state.cartItems);
    final favItems = [...state.favItems];
    // Find the product in the cart
    final existingProductIndex =
        cartItems.indexWhere((p) => p.id == product.id);
    if (existingProductIndex != -1) {
      if (cartItems[existingProductIndex].productCount > 0) {
        cartItems[existingProductIndex].productCount--;
      } else {
        cartItems.removeAt(existingProductIndex);
      }
    }
    emit(CartState(cartItems, state.productCount - 1, favItems));
  }

  void addToFav(Product product) {
    final cartItems = [...state.cartItems];
    final isItemInFav = state.favItems.any((item) => item.id == product.id);
    if (isItemInFav) {
      return;
    }

    final updatedFav = [...state.favItems, product];
    emit(CartState(cartItems, 1, updatedFav));
  }

  void removeFav(Product product) {
    final favItems = [...state.favItems];
    favItems.remove(product);
    final CartItems = [...state.cartItems];
    emit(CartState(CartItems, 1, favItems));
  }
}
