import 'package:dartz/dartz.dart';
import 'package:flutter_register_login/data/model/signup_req_params.dart';

import '../../data/model/signin_req_params.dart';

abstract class AuthRepository{
Future<Either> signup(SignupReqParams signupReq);
Future<Either> signin(SigninReqParams signinReq);
Future<bool> isLoggedIn();
Future<Either> getUser();
Future logout() ;
}