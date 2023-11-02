part of 'record_sowing_bloc.dart';

sealed class RecordSowingEvent extends Equatable {
  const RecordSowingEvent();

  @override
  List<Object> get props => [];
}

class RecordSowingPostEvent extends RecordSowingEvent {
  const RecordSowingPostEvent(this.ram);
  final RecordActivityModel ram;
}

class RecordSowingLoadingStopEvent extends RecordSowingEvent {}
