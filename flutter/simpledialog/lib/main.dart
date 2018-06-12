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
enum Answer{YES,NO,MAYBE}

class _State extends State<MyApp>
{
  String _value = " ";

  void _setData(String str)=> setState(()=> _value =str);

  Future _askUser()async
  {
    switch(
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: new Text("Do You Like The Basics"),
            children: <Widget>[
              new SimpleDialogOption(onPressed: ()=>Navigator.pop(context,Answer.YES),child: new Text("Yes!!!"),),
              new SimpleDialogOption(onPressed: ()=>Navigator.pop(context,Answer.NO),child: new Text("No :("),),
              new SimpleDialogOption(onPressed: ()=>Navigator.pop(context,Answer.MAYBE),child: new Text("MayBe :|"),),
            ],
          );
        }
      )
    )
      {
        case Answer.YES:
          _setData("Yes");
          break;
        case Answer.NO:
          _setData("No");
          break;
        case Answer.MAYBE:
          _setData("MayBe");
          break;
      }
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
              new Text(_value),
              new RaisedButton(onPressed: _askUser,child: new Text("Review"),)
            ],
          ),
        ),
      ),
    );
  }
}