import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Layout_3',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Basic layout"),
        ),
        body: new Container(
          decoration: new BoxDecoration(
            color: Colors.pink,
            border: new Border.all(color: Colors.yellowAccent,width: 10.0),
            borderRadius: const BorderRadius.all(const Radius.circular(32.0))
          ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Expanded(child: new Image.asset('images/pic1.jpg')),
                      new Expanded(flex:3,child: new Image.asset('images/pic2.jpg')),
                      new Expanded(child: new Image.asset('images/pic3.jpg')),
                    ],
                  ),
                ),
                new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Image.asset('images/pic4.jpg'),
                      new Image.asset('images/pic5.jpg'),
                      new Image.asset('images/pic6.jpg'),
                    ],
                  ),
                )
              ],
            )
        ),
      )
    );
  }
}