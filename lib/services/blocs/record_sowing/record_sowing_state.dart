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
  //* বপন
  final TextEditingController sowingCrop = TextEditingController();
  final TextEditingController sowingNameWithCompany = TextEditingController();
  final TextEditingController sowingSeedQuantity = TextEditingController();
  final TextEditingController sowingSeedUnit = TextEditingController();
  final TextEditingController sowingSeedPrice = TextEditingController();
  //* জমি তৈরী
  final TextEditingController landPhoto = TextEditingController();
  final TextEditingController landPepDate = TextEditingController();
  //* সেচ রেকর্ড
  final TextEditingController irrigationWateringHours = TextEditingController();
  //* সার প্রদান
  final TextEditingController fertilizerType = TextEditingController();
  final TextEditingController fertilizerName = TextEditingController();
  final TextEditingController fertilizerAmount = TextEditingController();

  ///* কীটনাশক প্রদান
  final TextEditingController pesticideType = TextEditingController();
  final TextEditingController pesticideName = TextEditingController();
  final TextEditingController pesticideAmount = TextEditingController();
  //* For everybody
  final TextEditingController details = TextEditingController();
  final List<XFile> images = [];

  // clear all the text editing controllers
  void clearAll() {
    name.clear();
    farmerID.clear();
    farm.clear();
    crop.clear();
    sowingCrop.clear();
    sowingNameWithCompany.clear();
    sowingSeedQuantity.clear();
    sowingSeedPrice.clear();
    sowingSeedUnit.clear();
    landPhoto.clear();
    landPepDate.clear();
    irrigationWateringHours.clear();
    fertilizerType.clear();
    fertilizerName.clear();
    fertilizerAmount.clear();
    pesticideType.clear();
    pesticideName.clear();
    pesticideAmount.clear();
    details.clear();
    images.clear();
  }
}

final class RecordSowingLoading extends RecordSowingState {}

final class RecordSowingSuccess extends RecordSowingState {}

final class RecordSowingFailed extends RecordSowingState {}
