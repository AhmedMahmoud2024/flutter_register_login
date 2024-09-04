import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_register_login/core/configs/constants/app_urls.dart';
import 'package:flutter_register_login/core/network/dio_client.dart';
import '../../service_locator.dart';
import '../model/signup_req_params.dart';

abstract class AuthApiService{
  Future<Either> signup(SignupReqParams signupReq);
}

class AuthApiServiceImpl extends AuthApiService{
  @override
  Future<Either> signup(SignupReqParams signupReq) async{
    try{
   var response = await sl<DioClient>().post(
      ApiUrls.register, //endpoint
      data: signupReq.toMap() //tomap =convert to object
    );
   return Right(response);
    } on DioException catch(e){
    return Left(e.response!.data['message']) ;
    }
  }

}