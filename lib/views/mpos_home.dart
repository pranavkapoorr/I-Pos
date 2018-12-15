import 'package:altapay_link_mpos/views/mpos_functions.dart';
import 'package:altapay_link_mpos/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:altapay_link_mpos/main.dart';

class MposHome extends StatefulWidget {
  @override
  _MposHomeState createState() => _MposHomeState();

}

class _MposHomeState extends State<MposHome>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    new MposFunctions(),
    new Settings()
  ];

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
        title: new Text("A-POS",style: new TextStyle(fontSize:30.0,color: Theme.of(context).accentColor),),),
      body: (sIp != null && sPort != null)?_children[_currentIndex]:setUp(),
      bottomNavigationBar: BottomNavigationBar(onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.payment), title: Text("Pos")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        fixedColor: Colors.deepOrange.shade400
      ),
    );
  }
  Widget setUp()=>new Container(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange.shade400,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(alignment: Alignment.topCenter,child: Text("QUICK SETUP!",style: TextStyle(color:Colors.white,fontSize: 25.0,fontWeight: FontWeight.w500),)),
                            ),
                            Align(alignment: Alignment.topLeft,child: Text("Server EndPoints",style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.w500),)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0))
                                  ),
                                  child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Ip address"),controller: null,)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0))
                                  ),
                                  child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Port"),controller: null,)
                              ),
                            ),
                            Text("What is the service ip adress and port..?",style: TextStyle(color: Colors.white70,fontSize: 12.0),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(alignment: Alignment.center,child: FlatButton(shape: Border.all(color: Colors.white),splashColor: Colors.white,textColor: Colors.white,onPressed: (){}, child: Text('Submit')),),
                      )
                    ]
                )),
          )
      )
  );

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}