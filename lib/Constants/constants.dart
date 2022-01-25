import 'package:flutter/material.dart';

String kBackgroundHash = "L55|R2IQ%7V;EZxMabf*RNp1NBxd";

TextStyle kStandardWhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold
);

InputDecoration kLogInInputDecoration = InputDecoration(
  filled: false,
  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff7F8EA7))),
  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffC7CBD1))),
  focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  hintText: "",
  hintStyle: TextStyle(color: Color(0xff7F8EA7)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
);