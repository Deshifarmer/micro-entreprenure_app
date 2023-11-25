part of 'finance_page_bloc.dart';

/// {@template finance_page_state}
/// FinancePageState description
/// {@endtemplate}
class FinancePageState extends Equatable {
  /// {@macro finance_page_state}
  const FinancePageState({
    this.customProperty = 'Finance',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current FinancePageState with property changes
  FinancePageState copyWith({
    String? customProperty,
  }) {
    return FinancePageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template finance_page_initial}
/// The initial state of FinancePageState
/// {@endtemplate}
class FinancePageInitial extends FinancePageState {
  /// {@macro finance_page_initial}
  const FinancePageInitial() : super();
}
