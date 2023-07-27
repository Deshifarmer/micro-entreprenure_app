import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/login_entity/login_response_entity.dart';
import 'package:deshifarmer/domain/repositories/login_response_repo.dart';

class LoginRepoImpl extends LoginResponseRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();
  @override
  Future<Result<SuccessLoginEntity, Exception>> login(
    String mail,
    String pass,
  ) async {
    return _dfAPi.userLogin(mail, pass);
  }
}
