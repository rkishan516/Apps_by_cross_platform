import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
  )
);


class MyApp extends StatefulWidget
{
  @override
  _State createState() => new _State();
}
class _State extends State<MyApp>
{
  Future _showalert(BuildContext context,String Aalert) async
  {
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
            return AlertDialog(
              title: new Text(Aalert),
              actions: <Widget>[
                new FlatButton(onPressed: ()=> Navigator.pop(context), child: new Text("Close"))
              ],
            );
        }
        );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello world"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(12.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Hello world"),
              new RaisedButton(onPressed: ()=> _showalert(context, "Hey Go Out of Here"),child: new Text("Click Me"),)  
            ],
          ),
        ),
      ),
    );
  }
}