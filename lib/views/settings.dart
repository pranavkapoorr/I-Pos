
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget{
  @override
  _SettingsState createState() => new _SettingsState();
}
class _SettingsState extends State<Settings>{
  SharedPreferences sp;
  String ip = "";
  int port = 0;
  TextEditingController ipCtrl, portCtrl;

  @override
  void initState() {
    SharedPreferences.getInstance().then((sP){
        this.sp = sP;
        ip = sp.getString("ip");
        port = sp.getInt("port");
        print("loaded $ip and $port");
    }).whenComplete((){
      ipCtrl = new TextEditingController();
      portCtrl = new TextEditingController();
      ipCtrl.text = ip.toString();
      portCtrl.text = port.toString();
      setState(() {});
    });

    super.initState();
  }



  @override
  void dispose() {
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
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Ip address"),controller: ipCtrl,)
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
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Port"),controller: portCtrl,)
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
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Ip address"),controller: ipCtrl,)
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
                            child: TextField(decoration: InputDecoration.collapsed(hintText: "Enter Port"),controller: portCtrl,)
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
                      Align(alignment: Alignment.topLeft,child: Text("Visibility",style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.w500),)),
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
                                    IconButton(icon: Icon(Icons.refresh), onPressed: (){})
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Would you like to be searched by everyone..?",style: TextStyle(color: Colors.white70,fontSize: 12.0))
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
                                applicationName: "A-POS",
                                applicationIcon: Icon(Icons.people,color: Colors.grey),
                                child: Text("A-POS",style: TextStyle(color: Colors.black,fontSize: 14.0,fontWeight: FontWeight.normal)),
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