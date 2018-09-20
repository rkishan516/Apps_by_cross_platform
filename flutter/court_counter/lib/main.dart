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
  int value1,value2;

  @override
  void initState() {
    value1=0;
    value2=0;
  }
  void onPressed1f()
  {
    setState(() {
      value1 += 1;
    });
  }
  void onPressed12()
  {
    setState(() {
      value1 += 2;
    });
  }
  void onPressed13()
  {
    setState(() {
      value1 += 3;
    });
  }
  void onPressed2f()
  {
    setState(() {
      value2 += 1;
    });
  }
  void onPressed22()
  {
    setState(() {
      value2 += 2;
    });
  }
  void onPressed23()
  {
    setState(() {
      value2 += 3;
    });
  }
  void reSet()
  {
    setState(() {
      value1=value2=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Court Counter"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.all(30.0),child: new Text("HOME"),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new Text('$value1',textScaleFactor: 3.0),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new RaisedButton(onPressed: onPressed13,color: Colors.blue,child: new Text("+3 POINTS"),),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new RaisedButton(onPressed: onPressed12,color: Colors.blue,child: new Text("+2 POINTS"),),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new RaisedButton(onPressed: onPressed1f,color: Colors.blue,child: new Text("FREE THROW"),),),
                  ],
                ),
              ),
              new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.all(30.0),child: new Text("HOME"),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new Text('$value2',textScaleFactor: 3.0),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new RaisedButton(onPressed: onPressed23,color: Colors.blue,child: new Text("+3 POINTS"),),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new RaisedButton(onPressed: onPressed22,color: Colors.blue,child: new Text("+2 POINTS"),),),
                    new Padding(padding: new EdgeInsets.all(10.0),child: new RaisedButton(onPressed: onPressed2f,color: Colors.blue,child: new Text("FREE THROW"),),),
                  ],
                ),
              ),
            ],
          ),
            new Expanded(child: new Center(
              child: new RaisedButton(onPressed: reSet,color: Colors.blue,child: new Text("Reset"),),
            ),
            ),
         ],
        ),
      ),
    );
  }
}