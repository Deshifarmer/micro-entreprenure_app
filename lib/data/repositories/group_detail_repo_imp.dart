import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/group_detail_entity/group_detail_entity.dart';
import 'package:deshifarmer/domain/repositories/group_detail_repo.dart';

class GroupDetailRepoImpl extends GroupDetailRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();

  @override
  Future<Result<GroupDetailEntity, Exception>> getGroupDetails(
    String token,
    String groupID,
  ) {
    return _dfAPi.getGroupDetails(token, groupID);
  }
}
