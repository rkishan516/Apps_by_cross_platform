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
class _State extends State<MyApp> with TickerProviderStateMixin
{
  Animation animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();

    controller = new AnimationController(duration: const Duration(milliseconds: 10000),vsync: this);
    final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);

    controller.forward();
  }

  Widget builder(BuildContext context, Widget child) {
    return new Container(
      height: animation.value,
      width: animation.value,
      child: new FlutterLogo(),
    );
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
          child:new AnimatedBuilder(animation: animation, builder: builder),
        ),
      ),
    );
  }
}