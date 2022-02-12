import 'dart:developer';

import 'package:ecomm/Screens/user_landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecomm/main.dart';

class DashboardRoute extends MaterialPageRoute {
  DashboardRoute({required WidgetBuilder builder}) : super(builder: builder);
}

class FirebaseAuthentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future SignIn(
      {required BuildContext context,
      required GlobalKey<FormState> formKey,
      required String email,
      required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      try {
        var authUser = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        //TODO: Implement Firebase Auth Signin
        if (authUser != null) {
          Navigator.pushAndRemoveUntil(context,
              DashboardRoute(builder: (_) => LandingPage()), (r) => false);
        }
        //Remove This

        //Remove This

      } on Exception {
        log("wrong id/pass");
        // TODO : Handle Wrong ID/PASS

      }
    }
  }
  Future SignUp(
      {required BuildContext context,
      required GlobalKey<FormState> formKey,
      required String email,
      required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      try {
        var authUser = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
          if(authUser != null){
            Navigator.pushAndRemoveUntil(context,
                DashboardRoute(builder: (_) => LandingPage()), (r) => false);
          }
      }
      on Exception {
        log("wrong id/pass");
        // TODO : Handle Wrong ID/PASS

      }
    }
}
}