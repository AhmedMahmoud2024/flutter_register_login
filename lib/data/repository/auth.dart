import 'package:dartz/dartz.dart';
import 'package:flutter_register_login/data/source/auth_api_service.dart';

import '../../domain/repository/auth.dart';
import '../../service_locator.dart';
import '../model/signup_req_params.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signup(SignupReqParams signupReq)async {
   return sl<AuthApiService>().signup(signupReq);
  }

}