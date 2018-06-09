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
  bool _value1 =false;
  bool _value2 =false;

  void _value1change(bool value)=> setState(()=> _value1 =value);
  void _value2change(bool value)=> setState(()=> _value2 =value);
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
              new Checkbox(value: _value1, onChanged: _value1change,activeColor: Colors.red,),
              new CheckboxListTile(value: _value2,
                onChanged: _value2change,
                title: new Text("Hello World"),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text("Good Morning"),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}