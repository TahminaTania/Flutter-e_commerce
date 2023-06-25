part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  ProductLoadedState(this.products);
  final List<Product> products;
  @override
  List<Object> get props => [];
}

class DataDetailsState extends ProductState {
  DataDetailsState(this.details);
  final Product details;
  @override
  List<Object> get props => [details];
}

class ProductErrorState extends ProductState {
  ProductErrorState(this.errormsg);
  final String errormsg;
}

// ------------------- Cart iTem added---------
class CartState extends ProductState {
  CartState(this.cartItems);

  final List<Product> cartItems;

  @override
  List<Object> get props => [cartItems];
}
