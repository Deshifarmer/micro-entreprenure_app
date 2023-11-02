part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryDataFetch extends CategoryEvent {
  const CategoryDataFetch(this.token);
  final String token;
}
