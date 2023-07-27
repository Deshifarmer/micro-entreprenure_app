import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/product_repo_impl.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_entity.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBBloc extends Bloc<ProductsEEvent, ProductsSState> {
  ProductsBBloc() : super(ProductsIInitial()) {
    on<ProductFetchEvent>((ProductFetchEvent event, emit) async {
      final products = await productListRepoImpl.getProductListo(event.token);
      final value = switch (products) {
        Success(data: final succ) => succ,
        ServerFailor(error: final err) => err,
      };
      if (value is ProductEntity) {
        if (value.data != null) {
          _productDatas.addAll(value.data!);
        }
        emit(
          ProductSuccess(
            productEntity: value,
            productDatas: _productDatas,
          ),
        );
      } else {
        emit(ProductFailed());
      }
    });
    on<ProductFetchPaginationEvent>(
        (ProductFetchPaginationEvent event, emit) async {
      final pp = await productListRepoImpl.getProductListoPaginate(
        event.token,
        event.nextPage,
      );
      final value = switch (pp) {
        Success(data: final succ) => succ,
        ServerFailor(error: final err) => err,
      };
      if (value is ProductEntity) {
        if (value.data != null) {
          _productDatas.addAll(value.data!);
        }
        emit(
          ProductSuccess(
            productEntity: value,
            productDatas: _productDatas,
          ),
        );
      }
    });
  }
  final List<ProductData> _productDatas = [];

  /// Fetch next page paginate

  ProductListRepoImpl productListRepoImpl = ProductListRepoImpl();
}
