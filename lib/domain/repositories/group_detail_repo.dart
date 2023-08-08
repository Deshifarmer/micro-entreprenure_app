// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/group_detail_entity/group_detail_entity.dart';

/// farmer list repo
abstract class GroupDetailRepo {
  Future<Result<GroupDetailEntity, Exception>> getGroupDetails(
    String token,
    String groupID,
  );
}
