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
  int _counter =0;
  List<Widget> _list = new List<Widget>();


  @override
  void initState() {
    for(int i=0;i<5;i++)
      {
        Widget child = _newItem(i);
        _list.add(child);
      }
  }

  void _onClicked()
  {
    Widget child = _newItem(_counter);
    setState(() {
      _list.add(child);
    });
  }

  Widget _newItem(int i)
  {
    Key key = new Key("item ${i}");
    Container child = new Container(
      key: key,
      padding: new EdgeInsets.all(12.0),
      child: new Chip(
          label: new Text("${i} Name Here"),
          deleteIconColor: Colors.red,
          deleteButtonTooltipMessage: "Deleted",
          onDeleted: ()=> _removeItem(key),
          avatar: new CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: new Text(i.toString()),
          ),
      ),
    );
    _counter++;
    return child;
  }

  void _removeItem(Key key)
  {
    for(int i=0;i<_list.length;i++)
      {
        Widget child = _list.elementAt(i);
        if(child.key == key)
          {
            setState(() {
              _list.removeAt(i);
              print("removing ${key.toString()}");
            });
          }
      }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello world"),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: _onClicked,child: new Icon(Icons.add),),
      body: new Container(
        padding: const EdgeInsets.all(12.0),
        child: new Center(
          child: new Column(
            children: _list
          ),
        ),
      ),
    );
  }
}