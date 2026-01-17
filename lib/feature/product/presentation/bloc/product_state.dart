part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final ProductModel products;

  ProductLoaded(this.products);
}

final class ProductError extends ProductState {
  final ProductFailure failure;

  ProductError(this.failure);
}

sealed class ProductFailure {}

final class NetworkFailure extends ProductFailure {
  final String message;
  NetworkFailure(this.message);
}

final class ClientFailure extends ProductFailure {
  final String message;
  ClientFailure(this.message);
}
