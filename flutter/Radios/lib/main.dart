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
  int _value =0;
  int _value2=0;

  void _setValue1(int value)
  {
    setState(() {
      _value=value;
    });
  }
  void _setValue2(int value)
  {
    setState(() {
      _value2=value;
    });
  }

  Widget makeRadios()
  {
    List<Widget> list = new List<Widget>();
    for(int i=0;i<4;i++){
      list.add(new Radio(value: i, groupValue: _value, onChanged: _setValue1),);
    }
    Column column = new Column(children: list,);
    return column;
  }
  Widget makeRadiosTiles()
  {
    List<Widget> list = new List<Widget>();
    for(int i=0;i<4;i++){
      list.add(new RadioListTile(value: i,
          groupValue: _value2,
          onChanged: _setValue2,
          activeColor: Colors.lightGreenAccent,
          controlAffinity: ListTileControlAffinity.trailing,
          title: new Text("Goods: ${i}"),
          subtitle: new Text("Hello"),
          secondary:new Icon(Icons.school),
      ));
    }
    Column column = new Column(children: list,);
    return column;
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
          child: new Column(
            children: <Widget>[
              makeRadios(),
              makeRadiosTiles()
            ],
          ),
        ),
      ),
    );
  }
}