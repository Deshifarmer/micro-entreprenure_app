import 'package:json_annotation/json_annotation.dart';

part 'single_crop_entity.g.dart';

@JsonSerializable()
class SingleCropEntity {
  final String name;

  const SingleCropEntity({
    required this.name,
  });

  factory SingleCropEntity.fromJson(Map<String, dynamic> json) =>
      _$SingleCropEntityFromJson(json);
}
