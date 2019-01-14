import 'package:altapay_link_mpos/utils/tcp.dart';
import 'package:altapay_link_mpos/views/mpos_functions.dart';
import 'package:altapay_link_mpos/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MposHome extends StatefulWidget {
  @override
  _MposHomeState createState() => _MposHomeState();

}

class _MposHomeState extends State<MposHome>{
  SharedPreferences sp;
  int _currentIndex = 0;
  TextEditingController sipctr;
  TextEditingController sportctr;
  String sIp,sPort,pIp,pPort;

  List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _loadSPAndConnect();
    sipctr = new TextEditingController();
    sportctr = new TextEditingController();
  }

  _loadSPAndConnect()async{
    sp = await SharedPreferences.getInstance();
    sIp = sp.getString("sIp");
    sPort = sp.getInt("sPort").toString();
    pIp = sp.getString("pIp");
    pPort = sp.getInt("pPort").toString();
    print("lodaded ip nd port : $sIp and $sPort");
    _children = [
    new MposFunctions(pIp: pIp,pPort: pPort),
    new Settings()
    ];
    setState(() {
      //to change ui if sip sport already there
    });
    if(sIp != null && sPort != null){
      connection.connect(sIp, int.parse(sPort));
    }
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepOrange.shade400,
          elevation: 0.0,
        title: new Text("A-POS",style: new TextStyle(fontSize:30.0,color: Colors.white),),),
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
  Widget setUp(){
    return new Container(
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
                                    child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Ip address"),controller: sipctr,)
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
                                    child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Port"),controller: sportctr,)
                                ),
                              ),
                              Text("What is the service ip adress and port..?",style: TextStyle(color: Colors.white70,fontSize: 12.0),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(alignment: Alignment.center,child: FlatButton(shape: Border.all(color: Colors.white),splashColor: Colors.white,textColor: Colors.white,onPressed: (){
                            print("sipctr->  ${sipctr.text}, sportctr-> ${sportctr.text}");
                            sIp =  sipctr.text;
                            sPort = sportctr.text;
                              sp.setString("sIp", sIp).then((lol) =>
                                  sp.setInt("sPort", int.parse(sPort))).whenComplete(() {
                                connection.connect(sIp, int.parse(sPort));
                                setState(() {

                                });
                              });
                          }, child: Text('Submit')),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(alignment: Alignment.center,child: FlatButton(shape: Border.all(color: Colors.white),splashColor: Colors.white,textColor: Colors.white,onPressed: (){
                            print("$sIp and x $sPort");

                          }, child: Text('Submit')),),
                        )
                      ]
                  )
              ),
            )
        )
    );
  }


    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

  @override
  void dispose() {
    sipctr.dispose();
    sportctr.dispose();
    super.dispose();
  }
}