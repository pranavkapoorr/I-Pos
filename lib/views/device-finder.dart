import 'dart:io';
import 'package:flutter/material.dart';

class DeviceFinderScreen extends StatefulWidget{

  @override
  _DeviceFinderScreenState createState() => new _DeviceFinderScreenState();

}

class _DeviceFinderScreenState extends State<DeviceFinderScreen>{
  List<String> _list = new List();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        title: Text("Scan Devices"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange.shade400,
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: new ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,
                          child: Text("Server EndPoints", style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0)
                                )
                            ),
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter target port"),
                              controller: null,)
                        ),
                      ),

                      Text("What is the service ip adress and port..?",
                        style: TextStyle(color: Colors.white70, fontSize: 12.0),),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Colors.white,
                          child: Text("Scan"),
                          onPressed: (){
                            _list.clear();
                            scanDevices();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/2),
                  child: _list.length>0?ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (context,index)=>
                      new  AnimatedContainer(
                        margin: EdgeInsets.all(8.0),
                        curve: ElasticInCurve(5.0),
                        duration: new Duration(seconds: 2),
                        color: Colors.white,
                        child: new ListTile(leading: Icon(Icons.phonelink),title: Text(_list[index]),),
                      )
                  ):Text(""),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }



  void scanDevices(){
    for(int i =1;i<254;i++){
      Socket.connect("192.168.0.$i", 40001).then((s){
        _list.add("192.168.0.$i");
        s.destroy();
        setState(() {
        });
      }).catchError((e){});
    }



  }

}

