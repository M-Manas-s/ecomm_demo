import 'package:ecomm/Constants/constants.dart';
import 'package:ecomm/Constants/regex_validators.dart';
import 'package:ecomm/Services/authentication.dart';
import 'package:ecomm/Widgets/authentication_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> _formKey;
  String email = " ";
  String password = " ";
  bool state = true;
  FirebaseAuthentication _firebaseAuthentication = FirebaseAuthentication();

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {});
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Color(0xff360147)));
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            BlurHash(
              hash: kBackgroundHash,
              imageFit: BoxFit.fitHeight,
            ),
            Container(
              width: size.width,
              height: size.height,
              margin: EdgeInsets.symmetric(vertical: size.height * 0.08, horizontal: size.height * 0.045),
              child: SingleChildScrollView(
                child: Container(
                  width: size.width - size.height * 0.09,
                  height: size.height -  size.height * 0.16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Hero(
                              tag: "Icon",
                              child: Image.asset(
                                'Assets/icon.png',
                                width: size.width * 0.4,
                              )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "Sign In",
                            style: kStandardWhiteBold,
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          buildForm(size),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                            child: AuthenticationButton(
                                label: 'Sign In',
                                color: Color(0xff2B2439),
                                onPressed: () => () {
                                      Future.delayed(Duration(seconds: 0), () {
                                        _firebaseAuthentication.SignIn(context: context, formKey: _formKey, email: email, password: password);
                                      });
                                    },
                                height: size.height * 0.07),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: kStandardWhiteBold.copyWith(color: Color(0xff7F8EA7), fontSize: 17),
                          ),
                          SizedBox(height: size.height*0.015,),
                          Row(
                            children: [
                              Text(
                                "Sign up ",
                                style: kStandardWhiteBold.copyWith(fontSize: 17),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form buildForm(Size size) {
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-Mail",
                    style: kStandardWhiteBold.copyWith(
                      fontSize: 18,
                      color: Color(0xffC7CBD1),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      email = value.trim();
                    },
                    cursorColor: Colors.white,
                    textAlign: TextAlign.left,
                    decoration: kLogInInputDecoration.copyWith(hintText: "yourname@example.com"),
                    validator: emailChecker,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              //SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: kStandardWhiteBold.copyWith(
                      fontSize: 18,
                      color: Color(0xffC7CBD1),
                    ),
                  ),
                  Stack(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          password = value.trim();
                        },
                        obscureText: state,
                        cursorColor: Colors.white,
                        textAlign: TextAlign.left,
                        decoration: kLogInInputDecoration.copyWith(hintText: "yourpassword"),
                        validator: passwordValidator,
                      ),
                      Positioned(
                        top: 10,
                        right: 20,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                state = !state;
                              });
                            },
                            child: Icon(
                              !state ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
