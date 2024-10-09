// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/login_entity/login_response_entity.dart';

/// ShortUrlRepository
abstract class LoginResponseRepo {
  Future<Result<SuccessLoginEntity, Exception>> login(String mail, String pass);
}
