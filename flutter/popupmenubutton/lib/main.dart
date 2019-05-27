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

enum Animal {cat,dog,bird,fish,lizard}

class _State extends State<MyApp>
{
  Animal _selected = Animal.cat;
  String _value = "Make a Selection";
  List<PopupMenuEntry<Animal>> _items = new List<PopupMenuEntry<Animal>>();

  @override
  void initState() {
    for(Animal animal in Animal.values){
        _items.add(new PopupMenuItem(
            child: new Text(_getDisplay(animal)),
            value: animal,
        )
        );
    }
  }

  void _onSelected(Animal animal)
  {
    setState(() {
      _selected = animal;
      _value = "You Selected ${_getDisplay(animal)}";
    });
  }

  String _getDisplay(Animal animal)
  {
    int _index = animal.toString().indexOf(",");
    _index++;
    return animal.toString().substring(_index);
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
          child: new Row(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new Text(_value),
              ),
              new PopupMenuButton<Animal>(
                  child:  new Icon(Icons.input),
                  initialValue: Animal.cat,
                  onSelected: _onSelected,
                  itemBuilder: (BuildContext context) {
                    return _items;
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
