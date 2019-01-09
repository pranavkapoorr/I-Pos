import 'package:altapay_link_mpos/views/mpos_home.dart';
import 'package:flutter/material.dart';



void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'A-Link',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: new ThemeData(
          //primaryColor: new Color(0xffF4F4F4),
          //accentColor: new Color(0xffA1A9A9)
      ),
      home: new MposHome(),
    );
  }
}

