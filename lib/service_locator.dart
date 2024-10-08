import 'package:flutter_register_login/core/network/dio_client.dart';
import 'package:flutter_register_login/data/repository/auth.dart';
import 'package:flutter_register_login/data/source/auth_api_service.dart';
import 'package:flutter_register_login/data/source/auth_local_service.dart';
import 'package:flutter_register_login/domain/repository/auth.dart';
import 'package:flutter_register_login/domain/usecases/get_user.dart';
import 'package:flutter_register_login/domain/usecases/is_logged_in.dart';
import 'package:flutter_register_login/domain/usecases/logout.dart';
import 'package:flutter_register_login/domain/usecases/signin.dart';
import 'package:flutter_register_login/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

 final sl = GetIt.instance;

 void setupServiceLocator(){
  sl.registerSingleton<DioClient>(DioClient());
  //service
  sl.registerSingleton<AuthApiService>(
   AuthApiServiceImpl()
  );

  sl.registerSingleton<AuthLocalService>(
      AuthLocalServiceImpl()
  );
  //Repositories
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );
  //UseCases
  sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );

  sl.registerSingleton<LogoutUseCase>(
      LogoutUseCase()
  );


  sl.registerSingleton<SigninUseCase>(
      SigninUseCase()
  );
 }