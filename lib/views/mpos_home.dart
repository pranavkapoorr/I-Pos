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
      body: (sIp != null && sPort != null && pIp !=null && pPort!=null)?_children[_currentIndex]:setUp(),
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
                      child: Text("Basic Configurations",style: TextStyle(color:Colors.white,fontSize: 25.0,fontWeight: FontWeight.w500),),
                    )
                  ]
              ))
      )
  );

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}