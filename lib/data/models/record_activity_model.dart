import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:image_picker/image_picker.dart';

class RecordActivityModel {
  RecordActivityModel({
    required this.whatType,
    required this.sowingCrop,
    required this.details,
    required this.images,
    required this.fertilizerAmount,
    required this.fertilizerName,
    required this.fertilizerType,
    required this.irrigationWateringHours,
    required this.pesticideAmount,
    required this.pesticideName,
    required this.pesticideType,
    required this.sowingNameWithCompany,
    required this.sowingSeedQuantity,
    required this.sowingSeedUnit,
    required this.sowingSeedPrice,
    required this.token,
    required this.batchID,
    required this.landPepData,
  });

  //* বপন
  final String sowingCrop;
  final String sowingNameWithCompany;
  final String sowingSeedQuantity;
  final String sowingSeedUnit;
  final String sowingSeedPrice;
  //* জমি তৈরী
  final String landPepData;
  //* সেচ রেকর্ড
  final String irrigationWateringHours;
  //* সার প্রদান
  final String fertilizerType;
  final String fertilizerName;
  final String fertilizerAmount;
  //* কীটনাশক প্রদান
  final String pesticideType;
  final String pesticideName;
  final String pesticideAmount;
  //* For everybody
  final String details;
  final List<XFile> images;
  final ActivityTypeEnums whatType;
  //* token
  final String token;
  //* batchID
  final String batchID;
}
