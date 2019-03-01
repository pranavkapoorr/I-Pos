import 'package:v_pos/utils/tcp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget{

  @override
  _SettingsState createState() => new _SettingsState();
}
class _SettingsState extends State<Settings>{
  TextEditingController sipCtrl, sportCtrl,pipCtrl, pportCtrl;
  SharedPreferences sp;

  @override
  void initState() {
      sipCtrl = new TextEditingController();
      sportCtrl = new TextEditingController();
      pipCtrl = new TextEditingController();
      pportCtrl = new TextEditingController();
      _loadSharedPrefs();

    super.initState();
  }

  _loadSharedPrefs()async {
    sp = await SharedPreferences.getInstance();
    sipCtrl.text = sp.getString("sIp");
    sportCtrl.text = sp.getInt("sPort").toString();
    pipCtrl.text = sp.getString("pIp");
    pportCtrl.text = sp.getInt("pPort").toString();
  }


  @override
  void dispose() {
    sp.setString("sIp", sipCtrl.text);
    sp.setInt("sPort", int.parse(sportCtrl.text));
    sp.setString("pIp", pipCtrl.text);
    sp.setInt("pPort", int.parse(pportCtrl.text));
    sipCtrl.dispose();
    sportCtrl.dispose();
    pipCtrl.dispose();
    pportCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
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
                      Align(alignment: Alignment.topLeft,child: Text("Server EndPoints",style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0))
                            ),
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Ip address"),controller: sipCtrl,)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0))
                            ),
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Port"),controller: sportCtrl,)
                        ),
                      ),
                      Text("What is the service ip adress and port..?",style: TextStyle(color: Colors.white70,fontSize: 12.0),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("Device EndPoints",style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0))
                            ),
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Ip address"),controller: pipCtrl,)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0))
                            ),
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Port"),controller: pportCtrl,)
                        ),
                      ),
                      Text("What is the payment device ip adress and port..?",style: TextStyle(color: Colors.white70,fontSize: 12.0),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("Reconnect",style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            myContainer(
                              deviceSize.width,
                              Colors.white,
                              BorderRadius.only(topLeft: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Reload",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                    IconButton(icon: Icon(Icons.refresh), onPressed: (){
                                      connection.connect(sipCtrl.text, int.parse(sportCtrl.text));
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Would you like to connect again to the service..?",style: TextStyle(color: Colors.white70,fontSize: 12.0))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("Support",style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            myContainer(
                                deviceSize.width,
                                Colors.white, BorderRadius.only(topLeft: Radius.circular(8.0)),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.help,color:Colors.black),
                                        Text("Help & Support",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                        SizedBox(width: 10.0,)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 10.0,),
                            myContainer(
                                deviceSize.width,
                                Colors.white,
                                BorderRadius.only(bottomRight: Radius.circular(8.0)),
                                InkWell(
                                    child:Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(Icons.bug_report,color:Colors.black),
                                          Text("Report a Bug",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                          SizedBox(width: 10.0,)
                                        ],
                                      ),
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                      Text("We will appreciate for any feedback..!",style: TextStyle(color: Colors.white70,fontSize: 12.0))
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topLeft,child: Text("About",style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.w500),)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            myContainer(
                                deviceSize.width,
                                Colors.white,
                                BorderRadius.only(topLeft: Radius.circular(8.0)),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.data_usage,color:Colors.black),
                                        Text("Data Policy",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                        SizedBox(width: 10.0,)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 10.0,),
                            myContainer(
                                deviceSize.width,
                                Colors.white,
                                BorderRadius.only(bottomRight: Radius.circular(8.0)),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(Icons.indeterminate_check_box,color:Colors.black),
                                        Text("Terms",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                                        SizedBox(width: 10.0,)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 20.0,),
                            myContainer(
                              deviceSize.width,
                              Colors.white,
                              BorderRadius.all(Radius.circular(8.0)),
                              AboutListTile(
                                icon: Icon(Icons.info,color:Colors.black),
                                applicationName: "V-POS",
                                applicationIcon: Icon(Icons.people,color: Colors.grey),
                                child: Text("V-POS",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }


  Widget myContainer(double width, Color color,BorderRadius borderRadius,Widget child) => new Container(
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: child,
  );
}