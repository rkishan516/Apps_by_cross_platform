import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Layout_Interactivity',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("TapBox"),
        ),
        body: new Center(
          child: new MyHomePage(),
        ),
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _active = false;

  void change_active() {
    setState(() {
      if(_active){
        _active=false;
      }
      else{
        _active = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: change_active,
      child: new Container(
        child: new Center(
          child: new Text(_active ? 'Active' : 'Inactive',style: new TextStyle(fontSize: 32.0, color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.green : Colors.grey
        ),
      ),
    );
  }
}
