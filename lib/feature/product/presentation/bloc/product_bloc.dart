import 'package:app/feature/product/model/product_model.dart';
import 'package:app/feature/product/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final repository = ProductRepository();
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    on<LoadProducts>(_onLoadProducts);
    on<RefreshProducts>(_onRefreshProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await repository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products'));
    }
  }

  void _onRefreshProducts(RefreshProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await repository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to refresh products'));
    }
  }
}
