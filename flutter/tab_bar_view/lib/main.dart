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

class choice {
  final String title;
  final IconData icon;

  const choice({this.title,this.icon});
}
class _State extends State<MyApp> with SingleTickerProviderStateMixin
{
  TabController _controller;

  List<choice> _list = const <choice>[
    const choice(title: 'CAR', icon: Icons.directions_car),
    const choice(title: 'BICYCLE', icon: Icons.directions_bike),
    const choice(title: 'BOAT', icon: Icons.directions_boat),
    const choice(title: 'BUS', icon: Icons.directions_bus),
    const choice(title: 'TRAIN', icon: Icons.directions_railway),
    const choice(title: 'WALK', icon: Icons.directions_walk),
  ];


  @override
  void initState() {
    _controller = new TabController(length: _list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello world"),
        bottom: new PreferredSize(
            child: new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: new Container(
                  height: 40.0,
                  alignment: Alignment.center,
                  child: new TabPageSelector(controller: _controller,),
                )
            ),
            preferredSize: new Size.fromHeight(32.0)
        ),
      ),
      body: new TabBarView(
          controller: _controller,
          children: _list.map((choice item){
            return new Container(
              padding: new EdgeInsets.all(32.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(item.title),
                    new Icon(item.icon,size: 120.0,)
                  ],
                ),
              ),
            );
          }).toList()
      )
    );
  }
}