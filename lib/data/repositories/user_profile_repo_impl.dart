import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/domain/repositories/user_profile_repo.dart';

class UserProfileRepoImpl extends UserProfileRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();

  @override
  Future<Result<UserProfileEntity, Exception>> userProfile(
    String token,
  ) {
    return _dfAPi.userProfile(token);
  }
}
