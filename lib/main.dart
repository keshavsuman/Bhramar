import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gui/pages/Intropages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bhramar',
      home: IntroScreen(),
      theme: ThemeData(
          primaryColor: Color(int.parse('0xff100e34')),
          buttonColor: Color(int.parse('0xff100e34')),
          backgroundColor: Color(int.parse('0xffffffff')),
          textSelectionColor: Color(int.parse('0xff4f4bec')),
          cardColor: Color(int.parse('0xff100e34')),
          accentColor: Color(int.parse('0xff100e34')),
          focusColor: Color(int.parse('0xff100e34')),
          primaryIconTheme: IconThemeData(
            color:Color(int.parse('0xff100e34'))
          ),
          iconTheme: IconThemeData(
            color: Color(int.parse('0xffffbf18')),
          )),
    );
  }
}
