import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/group_farmer_entity.dart';

extension GroupFarmersActivity on List<GroupFarmerEntity> {
  // get ids
  List<String> get ids => map((e) => e.farmer_id!).toSet().toList();
}

extension ConvertingFarmerE2GroupE on FarmerEntity {
  // let's convert farmer entity to group farmer entity
  GroupFarmerEntity toGroupFarmerEntity() => GroupFarmerEntity(
        farmer_id: farmer_id,
        full_name: full_name,
        phone: phone,
        address: address,
        image: image,
        date_of_birth: date_of_birth,
        district: district,
        farm_area: '',
        first_name: first_name,
        gender: gender,
        last_name: last_name,
        usaid_id: usaid_id,
        village: village,
      );
}
