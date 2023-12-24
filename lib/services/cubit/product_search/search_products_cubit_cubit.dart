import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_products_cubit_state.dart';

class SearchProductsCubitCubit extends Cubit<SearchProductsCubitState> {
  SearchProductsCubitCubit()
      : super(
          const SearchProductsCubitInitial(
            cat: '',
            company: '',
            query: '',
          ),
        );

  void searchProducts({
    required String query,
    required String company,
    required String cat,
  }) =>
      emit(
        SearchProductsCubitInitial(
          query: query,
          company: company,
          cat: cat,
        ),
      );
}
