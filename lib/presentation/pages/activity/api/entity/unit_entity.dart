import 'package:json_annotation/json_annotation.dart';

part 'unit_entity.g.dart';

@JsonSerializable()
class UnitEntity {

  const UnitEntity({
    required this.unit,
  });

  factory UnitEntity.fromJson(Map<String, dynamic> json) =>
      _$UnitEntityFromJson(json);
  final String unit;
}
