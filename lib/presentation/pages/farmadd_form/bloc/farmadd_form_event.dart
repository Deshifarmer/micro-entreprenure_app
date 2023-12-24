part of 'farmadd_form_bloc.dart';

abstract class FarmaddFormEvent extends Equatable {
  const FarmaddFormEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_farmadd_form_event}
/// {@endtemplate}
class AddFarmFormEvent extends FarmaddFormEvent {
  /// {@macro custom_farmadd_form_event}
  const AddFarmFormEvent(
    this.farmModel,
    this.token,
  );
  final AddFarmModel farmModel;
  final String token;
}
