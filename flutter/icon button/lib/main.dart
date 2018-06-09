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
  int _value = 0;

  void _Add()
  {
    setState(() {
      _value++;
    });
  }
  void _Subtract()
  {
    setState(() {
      _value--;
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
              new Text("value = ${_value}"),
              new IconButton(icon: new Icon(Icons.add), onPressed: ()=> _Add()),
              new IconButton(icon: new Icon(Icons.remove), onPressed: ()=> _Subtract()),
            ],
          ),
        ),
      ),
    );
  }
}