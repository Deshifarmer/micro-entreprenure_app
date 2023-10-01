part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_products_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomProductsEvent extends ProductsEvent {
  const CustomProductsEvent();
}

class SelectCompanysEvent extends ProductsEvent {
  const SelectCompanysEvent(this.companyID,{
     this.category,
     this.query,
  });
  final String companyID;
  final String? category;
  final String? query;
}

class UnSelectCompanyEvent extends ProductsEvent {
  const UnSelectCompanyEvent();
}
