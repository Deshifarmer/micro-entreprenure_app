import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:image_picker/image_picker.dart';

class RecordActivityModel {
  RecordActivityModel({
    required this.whatType,

    /// old fields
    required this.token,
    required this.images,
    required this.crop,
    required this.quantity,
    required this.unit,
    required this.details,
    required this.batchID,

    /// new fields

    /// sowing
    required this.sowingExpectedHarvest,
    required this.sowingSeedQuantity,
    required this.sowingSeedCompany,
    required this.sowingSeedDate,
    required this.sowingseedPrice,
    required this.sowingSeedSource,

    /// land pref
    required this.landSize,
    required this.landPreDate,
    required this.landChemical,
    required this.landChemicalCompany,
    required this.landChemicalQuantity,

    /// date
    required this.weedingDate,
    required this.irrigatinDate,
  });

  /// land pref
  final String landSize;
  final String landPreDate;
  final String landChemical;
  final String landChemicalCompany;
  final String landChemicalQuantity;

  /// sowing
  final String sowingSeedCompany;
  final String sowingSeedQuantity;
  final String sowingseedPrice;
  final String sowingSeedSource;
  final String sowingSeedDate;
  final String sowingExpectedHarvest;

  /// irrigation
  final String irrigatinDate;

  /// weeding
  final String weedingDate;

  /// old fields
  final String token;
  final String batchID;
  final String crop;
  final String quantity;
  final String unit;
  final String details;
  final List<XFile> images;
  final ActivityTypeEnums whatType;
}
