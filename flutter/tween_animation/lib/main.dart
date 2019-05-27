import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(
  new MaterialApp(
    home: MyApp(),
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
    controller = AnimationController(duration: Duration(milliseconds: 5000),vsync:this);
    animation = Tween(begin: 0.0,end: 400.0).animate(controller);
    controller.forward();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world"),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          height: animation.value,
          width: animation.value,
          child: Center(child: FlutterLogo(size: 300.0)),
      ),
    );
  }
}
