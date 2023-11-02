part of 'search_products_cubit_cubit.dart';

sealed class SearchProductsCubitState extends Equatable {
  const SearchProductsCubitState();

  @override
  List<Object> get props => [];
}

final class SearchProductsCubitInitial extends SearchProductsCubitState {
  const SearchProductsCubitInitial({
    required this.query,
    required this.company,
    required this.cat,
  });
  final String query;
  final String company;
  final String cat;

  @override
  List<Object> get props => [query, company, cat];
}
