part of 'agri_advisory_bloc.dart';

/// {@template agri_advisory_state}
/// AgriAdvisoryState description
/// {@endtemplate}
class AgriAdvisoryState extends Equatable {
  /// {@macro agri_advisory_state}
  const AgriAdvisoryState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AgriAdvisoryState with property changes
  AgriAdvisoryState copyWith({
    String? customProperty,
  }) {
    return AgriAdvisoryState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template agri_advisory_initial}
/// The initial state of AgriAdvisoryState
/// {@endtemplate}
class AgriAdvisoryInitial extends AgriAdvisoryState {
  /// {@macro agri_advisory_initial}
  AgriAdvisoryInitial() : super();
  final TextEditingController subjects = TextEditingController();
  final TextEditingController timeslots = TextEditingController();
  final TextEditingController groupID = TextEditingController();
  final TextEditingController notes = TextEditingController();

  final List<XFile> images = [];
}

class AgriLoading extends AgriAdvisoryState {}

class AgriFailed extends AgriAdvisoryState {}

class AgriSuccessfully extends AgriAdvisoryState {}
