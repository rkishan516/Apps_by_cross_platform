import 'package:flutter/material.dart';
import 'clock.dart';

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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello world"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(12.0),
        child: new Center(
          child: new Padding(
              padding: new EdgeInsets.only(top: 220.0),
              child: new Column(
                children: <Widget>[
                  new Text("Time Is : "),
                  new Clock()
                ],
              ),
          )
        ),
      ),
    );
  }
}