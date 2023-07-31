import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';

class AllFarmerListResp {
  AllFarmerListResp(this.farmers);
  final List<FarmerEntity> farmers;
}
