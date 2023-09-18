import 'package:image_picker/image_picker.dart';

class AddFarmModel {
  AddFarmModel({
    required this.images,
    required this.farmerID,
    required this.farmName,
    required this.farmUnion,
    required this.farmLocation,
    required this.farmMouza,
    required this.farmLength,
    required this.farmSoilType,
    required this.farmStartingDate,
    required this.farmProducingCrop,
    // required this.farmLat,
    // required this.farmLon,
    required this.farmArea,
  });

  final List<XFile> images;
  final String farmerID;
  final String farmName;
  final String farmArea;
  final String farmLocation;
  final String farmUnion;
  final String farmMouza;
  final String farmLength;
  final String farmStartingDate;
  final String farmSoilType;
  // final String farmLat;
  // final String farmLon;
  final String farmProducingCrop;
}
