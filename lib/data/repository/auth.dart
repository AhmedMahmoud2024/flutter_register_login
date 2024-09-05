import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_register_login/data/source/auth_api_service.dart';
import 'package:flutter_register_login/data/source/auth_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/auth.dart';
import '../../service_locator.dart';
import '../model/signup_req_params.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signup(SignupReqParams signupReq)async {
   Either result= await sl<AuthApiService>().signup(signupReq);
   return  result.fold(
             (error) {
         return Left(error);
             },
             (data) async {
               Response response= data ;
               SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
               sharedPreferences.setString('token', response.data['token']);
            return Right(response);
             }
     );
  }

  @override
  Future<bool> isLoggedIn() async{
   return await sl<AuthLocalService>().isLoggedIn();
  }

}