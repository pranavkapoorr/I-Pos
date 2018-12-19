import 'package:altapay_link_mpos/views/mpos_home.dart';
import 'package:flutter/material.dart';
import 'package:altapay_link_mpos/utils/tcp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './utils/globals.dart' ;



SharedPreferences sp;

void main()async{
  sp = await SharedPreferences.getInstance();
  globals.sIP = sp.getString("sIp");
  globals.sPORT = sp.getInt("sPort").toString();
  globals.pIP = sp.getString("pIp");
  globals.pPORT = sp.getInt("pPort").toString();
  print("lodaded ip nd port : ${globals.sIP} and ${globals.sPORT}");
  if(globals.sIP != null && globals.sPORT != null){
    connection.connect(globals.sIP, int.parse(globals.sPORT));
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AltaPay-Link Pax',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: new ThemeData(
          primaryColor: new Color(0xffF4F4F4),
          accentColor: new Color(0xffA1A9A9)
      ),
      home: new MposHome(),
    );
  }
}

