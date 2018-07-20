import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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
class _State extends State<MyApp> with SingleTickerProviderStateMixin
{
  Animation<double> animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: new Duration(milliseconds: 5000),vsync:this);
    animation = new Tween(begin: 0.0,end: 400.0).animate(controller);
    controller.forward();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello world"),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          height: animation.value,
          width: animation.value,
          child: new Center(
              child: new FlutterLogo(size: 300.0,)
          )
      ),
    );
  }
}