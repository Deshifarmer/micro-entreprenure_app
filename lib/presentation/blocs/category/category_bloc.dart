import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/category_repo_impl.dart';
import 'package:deshifarmer/domain/entities/category_entity/all_categorys.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryDataFetch>(_onCategoryFetch);
  }

  CategoryRepoImpl categoryRepoImpl = CategoryRepoImpl();
  FutureOr<void> _onCategoryFetch(CategoryDataFetch event, emit) async {
    emit(CategoryLoading());
    final allCategory = await categoryRepoImpl.getCategories(event.token);
    final value = switch (allCategory) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };
    if (value is AllCategoryListResp) {
      emit(CategorySuccess(value));
    } else {
      emit(CategoryFailed());
    }
  }
}
