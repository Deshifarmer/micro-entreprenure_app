part of 'products_bloc.dart';

abstract class ProductsEEvent extends Equatable {
  const ProductsEEvent();

  @override
  List<Object> get props => [];
}

class ProductFetchEvent extends ProductsEEvent {
  const ProductFetchEvent(this.token);
  final String token;
}

class ProductFFetchPaginationEvent extends ProductsEEvent {
  const ProductFFetchPaginationEvent({
    required this.nextPage,
    required this.token,
  });
  final String token;
  final int nextPage;
}
