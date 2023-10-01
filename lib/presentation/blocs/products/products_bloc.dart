import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/data/repositories/product_repo_impl.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_entity.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBBloc extends Bloc<ProductsEEvent, ProductsSState> {
  ProductsBBloc() : super(ProductsIInitial()) {
    on<ProductFFetchEvent>((ProductFFetchEvent event, emit) async {
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
          ProductSSuccess(
            productEntity: value,
            productDatas: _productDatas,
          ),
        );
      } else {
        emit(ProductFFailed());
      }
    });
    on<ProductFFetchPaginationEvent>(
        (ProductFFetchPaginationEvent event, emit) async {
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
          ProductSSuccess(
            productEntity: value,
            productDatas: _productDatas,
          ),
        );
      }
    });
    on<ProductSearchEvent>((ProductSearchEvent event, emit) async {
      // clear the product list
      _productDatas.clear();
      final products = await deshiFarmerAPI.getProductSearch(
        event.token,
        event.company,
        event.cat,
        event.query,
      );
      final value = switch (products) {
        Success(data: final succ) => succ,
        ServerFailor(error: final err) => err,
      };
      if (value is ProductEntity) {
        if (value.data != null) {
          _productDatas.addAll(value.data!);
        }
        emit(
          ProductSSuccess(
            productEntity: value,
            productDatas: _productDatas,
          ),
        );
      } else {
        emit(ProductFFailed());
      }
    });
  }
  final List<ProductData> _productDatas = [];

  /// Fetch next page paginate

  ProductListRepoImpl productListRepoImpl = ProductListRepoImpl();
  DeshiFarmerAPI deshiFarmerAPI = DeshiFarmerAPI();
}
