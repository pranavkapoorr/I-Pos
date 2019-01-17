import 'package:flutter/material.dart';

class Receipt extends StatefulWidget{
  String title,data;

  Receipt({this.title,this.data});

  @override
  ReceiptState createState() => new ReceiptState();

}

class ReceiptState extends State<Receipt>{

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: new Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height/1.6,
        width: MediaQuery.of(context).size.width,
        child: Text(widget.data),
      ),
    ),
  );

}

