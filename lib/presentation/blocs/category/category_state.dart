part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  const CategorySuccess(this.allCategoryListResp);
  final AllCategoryListResp allCategoryListResp;
}

class CategoryFailed extends CategoryState {}
