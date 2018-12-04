import 'package:altapay_link_mpos/views/mpos_functions.dart';
import 'package:altapay_link_mpos/views/settings.dart';
import 'package:flutter/material.dart';

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
        title: new Text("ALTAPAY-LINK",style: new TextStyle(fontSize:30.0,color: Theme.of(context).accentColor),),),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cloud_circle), title: Text("Sounds")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        fixedColor: Colors.deepOrange.shade400
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}