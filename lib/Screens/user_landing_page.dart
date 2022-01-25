import 'package:ecomm/Widgets/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
    return Scaffold(
      body: Model3d(uri : "Assets/models/Astronaut/Astronaut.obj"),
      );
  }
}
