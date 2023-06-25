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

  const CartState(this.cartItems, this.productCount);

  @override
  List<Object> get props => [cartItems, productCount];
}
