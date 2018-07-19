import 'package:flutter/material.dart';

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
  double _value = 0.0;
  int _turns = 0;

  void _onChanged(double value){
    setState(() {
      _value = value;
      _turns = value.toInt();
    });
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
              new Slider(value: _value, onChanged: _onChanged,min: 0.0,max: 4.0,),
              new RotatedBox(quarterTurns: _turns,child: new Text("kishan"),),
            ],
          ),
        ),
      ),
    );
  }
}