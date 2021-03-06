import 'package:ecomm/Constants/constants.dart';
import 'package:ecomm/Screens/sign_in_page.dart';
import 'package:ecomm/Screens/user_landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  late String useremail;
  prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    useremail = prefs.getString('Email') ?? "";
  }
  @override
  void initState() {
    super.initState();
    prefs();
    Future.delayed(Duration(seconds: 3),(){
      if(useremail == "") {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => LoginPage()), (
            route) => false);}
      else{
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => LandingPage()), (
            route) => false);
      }});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            BlurHash(
              hash: kBackgroundHash,
              imageFit: BoxFit.fitHeight,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex:10,child: Hero(tag: "Icon",
                child: Image.asset('Assets/icon.png',width: MediaQuery.of(context).size.width*0.7,))),
                FittedBox(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width*0.15,
                    width: MediaQuery.of(context).size.width*0.15,
                    child: CircularProgressIndicator(
                      color: Colors.grey.withOpacity(0.7),
                      strokeWidth: 4,
                    ),
                  ),
                ),
                Expanded(child: Container(),flex: 2,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
