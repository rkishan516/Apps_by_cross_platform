import 'package:flutter/material.dart';

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
class _State extends State<MyApp>
{
  List<BottomNavigationBarItem> _items;
  String _values = '';
  int _index = 0;

  @override
  void initState() {
    _items = List();
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('People')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.weekend), title: Text('Weekend')));
    _items.add(BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('Message')));
  }

  int _value =0;
  String _value1=" ";

  void _add()=> setState(()=>_value++);
  void _remove()=> setState(()=>_value--);
  void _onChange() => setState(()=>_value1= DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world"),
        backgroundColor: Colors.red,
      actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _add),
          IconButton(icon: Icon(Icons.remove), onPressed: _remove),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _onChange,
          backgroundColor: Colors.red,
          mini: true,
          child: Icon(Icons.timer),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text('Hello Drawer'),
              RaisedButton(onPressed: () => Navigator.pop(context), child: Text('Close Drawer'),)
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(icon: Icon(Icons.timer), onPressed: _onChange),
        IconButton(icon: Icon(Icons.add), onPressed: _add),
        IconButton(icon: Icon(Icons.remove), onPressed: _remove),
      ],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32.0),),
              Text("Timer : ${_value1}"),
              Text(_values),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
