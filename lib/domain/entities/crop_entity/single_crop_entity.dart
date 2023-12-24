import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_crop_entity.g.dart';

@JsonSerializable()
class SingleCropEntity extends Equatable {
  const SingleCropEntity({
    required this.name,
  });

  factory SingleCropEntity.fromJson(Map<String, dynamic> json) =>
      _$SingleCropEntityFromJson(json);
  final String name;

  @override
  List<Object?> get props => [name];
}
