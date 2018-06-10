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
  List<BottomNavigationBarItem> _items;
  String _values = '';
  int _index = 0;

  @override
  void initState() {
    _items = new List();
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text('People')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.weekend), title: new Text('Weekend')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.message), title: new Text('Message')));
  }

  int _value =0;
  String _value1=" ";

  void _add()=> setState(()=>_value++);
  void _remove()=> setState(()=>_value--);
  void _onChange() => setState(()=>_value1=new DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello world"),
        backgroundColor: Colors.red,
      actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _remove),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _onChange,
          backgroundColor: Colors.red,
          mini: true,
          child: new Icon(Icons.timer),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('Hello Drawer'),
              new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Close Drawer'),)
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.timer), onPressed: _onChange),
        new IconButton(icon: new Icon(Icons.add), onPressed: _add),
        new IconButton(icon: new Icon(Icons.remove), onPressed: _remove),
      ],
      body: new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value.toString(),style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 32.0),),
              new Text("Timer : ${_value1}"),
              new Text(_values),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          setState((){
            _index = item;
            _values = "Current value is: ${_index.toString()}";
          });
        },

      ),
    );
  }
}