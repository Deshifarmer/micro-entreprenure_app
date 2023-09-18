part of 'record_sowing_bloc.dart';

sealed class RecordSowingState extends Equatable {
  const RecordSowingState();

  @override
  List<Object> get props => [];
}

final class RecordSowingInitial extends RecordSowingState {
  final TextEditingController name = TextEditingController();
  final TextEditingController farmerID = TextEditingController();
  final TextEditingController farm = TextEditingController();
  final TextEditingController crop = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController unit = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController activity_by = TextEditingController();
  final TextEditingController details = TextEditingController();
  final List<XFile> images = [];
}

final class RecordSowingLoading extends RecordSowingState {}

final class RecordSowingSuccess extends RecordSowingState {}

final class RecordSowingFailed extends RecordSowingState {}
