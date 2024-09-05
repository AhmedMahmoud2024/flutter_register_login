import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_register_login/common/bloc/button_state.dart';
import 'package:flutter_register_login/core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState>{
  ButtonStateCubit() : super(ButtonInitialState());



  void execute ({dynamic params ,required UseCase usecase}) async{

    emit(ButtonLoadingState()) ;
    await Future.delayed(const Duration(seconds: 2));

    try{
  Either result = await usecase.call(params);
    result.fold(

            (error) {
              emit(
                ButtonFailureState(errorMessage: error)
              );
            },
          (data) {
              emit(
              ButtonSuccessState()
              );
          }
    );
    }catch(e){
      emit(
        ButtonFailureState(errorMessage: e.toString())
      );
    }
  }
}