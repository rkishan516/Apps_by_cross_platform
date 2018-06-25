import 'package:flutter/material.dart';
import 'dart:math';

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
class Area{
  int index;
  String name;
  Color color;

  Area({this.index :-1,this.name : 'Area', this.color : Colors.lightBlueAccent});
}
class _State extends State<MyApp>
{
  int _location;
  List<Area> _item;


  @override
  void initState() {
    _item = new List<Area>();
    for(int i=0;i<16;i++)
      {
        _item.add(
          new Area(index: i,name: 'Area ${i}'),
        );
      }
      var rng = new Random();
      _location = rng.nextInt(_item.length);
  }

  Widget _generator(int index){
    return new GridTile(
        child: new Container(
          padding: new EdgeInsets.all(5.0),
          child: new RaisedButton(
              onPressed: ()=>_onPressed(index),
              color: _item[index].color,
              child: new Text(_item[index].name),
          ),
        )
    );
  }
  void _onPressed(int index){
    setState(() {
      if(index==_location)
        {
          _item[index].color = Colors.green;
        }
        else
          {
            _item[index].color = Colors.red;
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Guess The world"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(12.0),
        child: new Center(
          child: new GridView.count(crossAxisCount: 4,children: new List<Widget>.generate(16, _generator),)
        ),
      ),
    );
  }
}