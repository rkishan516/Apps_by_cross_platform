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
  String _value = "Hello World";
  void _onPressed()
  {
    setState(() {
      if(_value == "Hello World")
        {
          _value = new DateTime.now().toString();
        }
        else
          {
            _value = "Hello World";
          }
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
              new Text(_value),
              new RaisedButton(onPressed: ()=> _onPressed(),child: new Text("Click Me"),),
              new FlatButton(onPressed: ()=> _onPressed(),child: new Text("Click Me"),),
            ],
          ),
        ),
      ),
    );
  }
}