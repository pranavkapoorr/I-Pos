import 'package:altapay_link_mpos/views/mpos_home.dart';
import 'package:flutter/material.dart';
import 'package:altapay_link_mpos/utils/tcp.dart';
import 'package:shared_preferences/shared_preferences.dart';



SharedPreferences sp;
var sIp, sPort, pIp, pPort;

void main()async{
  sp = await SharedPreferences.getInstance();
  sIp = sp.getString("sPort");
  sPort = sp.getInt("sPort");
  pIp = sp.getString("pPort");
  pPort = sp.getInt("pPort");
  print("lodaded ip nd port : $sIp and $sPort");
  if(sIp != null && sPort != null && pIp !=null && pPort!=null){
    connection.connect("192.168.0.69", sPort);
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

