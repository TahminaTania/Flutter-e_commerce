import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/repository.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;
  List<Product> cartItems = [];
  ProductCubit({required this.repository}) : super(ProductInitialState()) {}

  Future<void> fetchdata() async {
    emit(ProductLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try {
      final response = await repository.getdata();
      emit(ProductLoadedState(response));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void addToCart(Product product) {
    if (state is ProductLoadedState) {
      final List<Product> cartItems = (state as ProductLoadedState).products;
      cartItems.add(product);
      emit(CartState(List<Product>.from(cartItems)));
      emit(ProductInitialState());
    }
  }
}
