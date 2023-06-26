part of 'cart_cubit.dart';

// class CartState extends Equatable {
//   final List<Product> cartItems;
//   //final   productCount ;

//   const CartState(this.cartItems);

//   @override
//   List<Object> get props => [cartItems];
// }

class CartState extends Equatable {
  final List<Product> cartItems;
  final int productCount;
  final List<Product> favItems;

  const CartState(this.cartItems, this.productCount, this.favItems);

  @override
  List<Object> get props => [cartItems, productCount, favItems];
}
