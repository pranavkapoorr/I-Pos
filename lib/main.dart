import 'package:altapay_link_mpos/views/mpos_home.dart';
import 'package:flutter/material.dart';
import 'package:altapay_link_mpos/utils/tcp.dart';
import 'package:shared_preferences/shared_preferences.dart';



SharedPreferences sp;
var ip, port;

void main()async{
  sp = await SharedPreferences.getInstance();
  ip = sp.getString("ip");
  port = sp.getInt("port");
  print("lodaded ip nd port : $ip and $port");
  if(ip == null && port == null){
    sp.setString("ip", "0.0.0.0").whenComplete(()=>ip = "0.0.0.0");
    sp.setInt("port", 8080).whenComplete(()=>port = 8080);
  }
  connection.connect("192.168.0.69", port);
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

