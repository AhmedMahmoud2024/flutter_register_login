import 'package:dartz/dartz.dart';
import 'package:flutter_register_login/data/model/signup_req_params.dart';

abstract class AuthRepository{
Future<Either> signup(SignupReqParams signupReq);
Future<bool> isLoggedIn();
//Future<Either> signin();
}