import 'package:deshifarmer/domain/entities/group_detail_entity/farmer_entity_group.dart';

// part 'all_group_farmer.g.dart';

class AllGroupFarmerListResp {
  AllGroupFarmerListResp(this.farmers);
  final List<FarmerEntityGroup> farmers;
}
