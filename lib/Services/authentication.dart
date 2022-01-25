import 'package:ecomm/Screens/user_landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {

  Future SignIn({required BuildContext context,required GlobalKey<FormState> formKey, @required String? email,@required String? password}) async {
    if (formKey.currentState!.validate()) {
      try {

        //TODO: Implement Firebase Auth Signin

        //Remove This

          return Future.delayed(Duration(seconds: 1),(){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LandingPage()), (route) => false);
          });

        //Remove This

      } on Exception {

        // TODO : Handle Wrong ID/PASS

      }
    }
  }

}