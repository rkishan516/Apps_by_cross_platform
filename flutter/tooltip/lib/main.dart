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
  String _value = "00:00:00.00";

  void _onPressed()=> setState(()=>_value = new DateTime.now().toString());
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
              new Text("The Time is : ${_value}"),
              new IconButton(icon: new Icon(Icons.timer), onPressed: _onPressed,tooltip: "Change To Current Time",),
            ],
          ),
        ),
      ),
    );
  }
}