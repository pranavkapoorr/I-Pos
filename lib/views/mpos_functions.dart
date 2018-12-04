import 'package:flutter/material.dart';
class MposFunctions extends StatefulWidget {
  @override
  _MposFunctionsState createState() => _MposFunctionsState();

}

class _MposFunctionsState extends State<MposFunctions>{


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       body: new SingleChildScrollView(
        child: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(decoration: new InputDecoration(hintText: "Amount in cents",prefixIcon: Icon(Icons.attach_money)),),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(decoration: new InputDecoration(hintText: "Transaction Reference",prefixIcon: Icon(Icons.note)),),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("PAYMENT",style: TextStyle(color: Colors.white),)))),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("REFUND",style: TextStyle(color: Colors.white),)))),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("REVERSAL",style: TextStyle(color: Colors.white),)))),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("FIRST DLL",style: TextStyle(color: Colors.white),)))),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("UPDATE DLL",style: TextStyle(color: Colors.white),)))),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("PED BALANCE",style: TextStyle(color: Colors.white),)))),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("END OF DAY",style: TextStyle(color: Colors.white),)))),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.deepOrange.shade400) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("PROBE PED",style: TextStyle(color: Colors.white),)))),
              ),
            ],
          ),
        ),
      ),

    );
  }

  }

