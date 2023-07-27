import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/product_repo_impl.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_entity.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBBloc extends Bloc<ProductsEEvent, ProductsSState> {
  ProductsBBloc() : super(ProductsInitial()) {
    on<ProductFetchEvent>((ProductFetchEvent event, emit) async {
      final _products = await productListRepoImpl.getProductListo(event.token);
      final value = switch (_products) {
        Success(data: final succ) => succ,
        ServerFailor(error: final err) => err,
      };
      if (value is ProductEntity) {
        emit(ProductSuccess(value));
      } else {
        emit(ProductFailed());
      }
    });
  }
  ProductListRepoImpl productListRepoImpl = ProductListRepoImpl();
}
