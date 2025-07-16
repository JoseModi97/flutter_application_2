import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/src/product/domain/usecases/get_all_products.dart';
import 'package:flutter_application_2/src/product/presentations/bloc/product_event.dart';
import 'package:flutter_application_2/src/product/presentations/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  ProductBloc({required this.getAllProductsUseCase}) : super(ProductInitial()) {
    on<GetAllProducts>((event, emit) async {
      emit(ProductLoading());
      final failureOrProducts = await getAllProductsUseCase(NoParams());
      failureOrProducts.fold(
        (failure) => emit(ProductError('Failed to fetch products')),
        (products) => emit(ProductLoaded(products)),
      );
    });
  }
}
