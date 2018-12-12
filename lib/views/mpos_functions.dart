import 'package:altapay_link_mpos/utils/tcp.dart';
import 'package:flutter/material.dart';
class MposFunctions extends StatefulWidget {
  @override
  _MposFunctionsState createState() => _MposFunctionsState();

}

class _MposFunctionsState extends State<MposFunctions>{
  TextEditingController _amount, _transactionReference;

  @override
  void initState() {
    super.initState();
    _amount = new TextEditingController();
    _transactionReference = new TextEditingController();
  }



  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
    child: Container(
    decoration: BoxDecoration(
    color: Colors.deepOrange.shade400,
    borderRadius: BorderRadius.circular(10.0)
    ),
         child: new SingleChildScrollView(
          child: new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
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
                      child: TextField(decoration: InputDecoration(hintText: "Amount in cents",border: InputBorder.none,prefixIcon: Icon(Icons.attach_money,)))
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
                      child: TextField(decoration: InputDecoration(hintText: "Transaction Reference",border: InputBorder.none,prefixIcon: Icon(Icons.note,)))
                  ),
                ),
                /*new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(decoration: new InputDecoration(hintText: "Amount in cents",hintStyle: TextStyle(color: Colors.white,),prefixIcon: Icon(Icons.attach_money,color: Colors.white,)),),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextFormField(decoration: new InputDecoration(hintText: "Transaction Reference",hintStyle: TextStyle(color: Colors.white,),prefixIcon: Icon(Icons.note,color: Colors.white,)),),
                ),*/
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white30,
                    shape: BoxShape.rectangle
                  ),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[

                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){
                          connection.writeToConnection('{"amount":"${_amount.text}","transactionReference":"${_transactionReference.text}","printFlag":1,"statusMessageIp":"","statusMessagePort":"","operationType":"Payment","pedIp":"192.168.44.216","pedPort":"40002","timeOut":"300"}');
                        }, child: new Text("PAYMENT",style: TextStyle(color: Colors.grey),)))),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("REFUND",style: TextStyle(color: Colors.grey),)))),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("REVERSAL",style: TextStyle(color: Colors.grey),)))),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("FIRST DLL",style: TextStyle(color: Colors.grey),)))),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("UPDATE DLL",style: TextStyle(color: Colors.grey),)))),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("PED BALANCE",style: TextStyle(color: Colors.grey),)))),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("END OF DAY",style: TextStyle(color: Colors.grey),)))),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(width: 300.0,decoration: new BoxDecoration(borderRadius: new BorderRadius.all(new Radius.circular(10.0)),color: Colors.white) ,child: new SizedBox(child: new FlatButton(onPressed: (){}, child: new Text("PROBE PED",style: TextStyle(color: Colors.grey),)))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
      ),
    );
  }

  @override
  void dispose() {
    _amount.dispose();
    _transactionReference.dispose();
    super.dispose();
  }

  }

