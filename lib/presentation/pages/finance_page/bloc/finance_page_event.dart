part of 'finance_page_bloc.dart';

abstract class FinancePageEvent  extends Equatable {
  const FinancePageEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_finance_page_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomFinancePageEvent extends FinancePageEvent {
  /// {@macro custom_finance_page_event}
  const CustomFinancePageEvent();
}
