// ignore_for_file: non_constant_identifier_names

/*
            "farmer_details": [
                {
                    "full_name": "samia nadiea",
                    "phone": "01711056775",
                    "image": "/image/farmer/far-6174-0c001.jpg"
                }
            ],
            "crop": "[\"গম\",\" পাট\",\" ধান\"]",
            "type": "[report problem, hervest, sowing]",
            "quantity": "6",
            "unit": "2 kg",
            "location": "[23.64983, 90.359065]",
            "activity_by": "ME-5cbb-0e310",
            "details": "power sdfasdfkv য I'm sorry to bother me I have no income tax withheld mean you can come get you",

            "images": "[\"farm/activity/01692599709.jpg\"]",
            "created_at": "2023-08-21T06:35:09.000000Z",
            "updated_at": "2023-08-21T06:35:09.000000Z"
 */

import 'package:json_annotation/json_annotation.dart';
part 'activity_entity.g.dart';

@JsonSerializable()
class ActivityEntity {
  ActivityEntity({
    required this.created_at,
    required this.images,
    required this.details,
    required this.activity_by,
    required this.farmer_details,
    required this.location,
    required this.unit,
    required this.quantity,
    required this.farmer_id,
    required this.crop,
    required this.type,
    required this.id,
    required this.name,
    required this.farm,
  });

  /// factory.
  factory ActivityEntity.fromJson(Map<String, dynamic> json) =>
      _$ActivityEntityFromJson(json);

  final int id;
  final String name;
  final String farmer_id;
  final String farm;
  final String crop;
  final String type;
  final String quantity;
  final String unit;
  final String location;
  final String activity_by;
  final String details;
  final String images;
  final String created_at;
  final List<dynamic> farmer_details;
}
