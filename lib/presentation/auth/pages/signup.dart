
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/button/basic_app_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
   
  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            minimum: const EdgeInsets.only(top: 100,right: 16,left: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signup(),
                  const SizedBox(height: 50,),
                  _userNameField(),
                  const SizedBox(height: 20,),
                  _emailField(),
                  const SizedBox(height: 20,),
                  _password(),
                  const SizedBox(height: 60,),
                  _createAccountButton(context),
                  const SizedBox(height: 20,),
                   _signinText(context)
                ],
              ),
            ),
      ) );
  }
  Widget _signup(){
    return const Text(
      'Sign Up',
      style: TextStyle(
        color: Color(0xff2A4ECA),
        fontWeight: FontWeight.bold,
        fontSize: 32
      ),
    );
  }

  Widget _userNameField() {
    return TextField(
      controller: _usernameCon,
      decoration: const InputDecoration(
        hintText: 'Username'
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Email'
      ),
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Password'
      ),
    );
  }

 Widget _createAccountButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: 'Create Account',
          onPressed: (){
            // context.read<ButtonStateCubit>().excute(
            //   usecase: sl<SignupUseCase>(),
            //   params: SignupReqParams(
            //     email: _emailCon.text,
            //     password: _passwordCon.text,
            //     username: _usernameCon.text
            //   )
            // );
          }
        );
      }
    );
  }

  Widget _signinText(BuildContext context){
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Do you have account?',
            style: TextStyle(
              color: Color(0xff3B4054),
              fontWeight: FontWeight.w500
            )
          ),
           TextSpan(
            text: ' Sign In',
            style: const TextStyle(
              color: Color(0xff3461FD),
              fontWeight: FontWeight.w500
            ),
            recognizer: TapGestureRecognizer()
                ..onTap = () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => SigninPage(),
                //   )
                // );
              }
          )
        ]
      ),
    );
  }
}