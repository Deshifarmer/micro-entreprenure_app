// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';

/// ShortUrlRepository
abstract class UserProfileRepo {
  Future<Result<UserProfileEntity, Exception>> userProfile(
    String token,
  );
}
