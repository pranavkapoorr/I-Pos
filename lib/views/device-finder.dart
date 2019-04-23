import 'package:flutter/material.dart';

class DeviceFinderScreen extends StatefulWidget{

  @override
  _DeviceFinderScreenState createState() => new _DeviceFinderScreenState();

}

class _DeviceFinderScreenState extends State<DeviceFinderScreen>{

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: new Scaffold(
      appBar: new AppBar(title: Text("Scan Devices"),),
      body: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height/1.6,
        width: MediaQuery.of(context).size.width,
        child: Text("body"),
      ),
    ),
  );

}

