import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
    theme: new ThemeData(
      primarySwatch: Colors.red,
    ),
  )
);


class MyApp extends StatefulWidget
{
  @override
  _State createState() => new _State();
}

enum Answer{YES,NO,MAYBE}

class _State extends State<MyApp>
{
  String _value4 = " ";

  void _setData(String str)=> setState(()=> _value4 =str);

  Future _askUser()async
  {
    switch(
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: new Text("Do You Like The Basics"),
            children: <Widget>[
              new SimpleDialogOption(onPressed: ()=>Navigator.pop(context,Answer.YES),child: new Text("Yes!!!"),),
              new SimpleDialogOption(onPressed: ()=>Navigator.pop(context,Answer.NO),child: new Text("No :("),),
              new SimpleDialogOption(onPressed: ()=>Navigator.pop(context,Answer.MAYBE),child: new Text("MayBe :|"),),
            ],
          );
        }
    )
    )
    {
      case Answer.YES:
        _setData("You Like Flutter");
        break;
      case Answer.NO:
        _setData("You Don't Like Flutter");
        break;
      case Answer.MAYBE:
        _setData("You MayBe Like Flutter");
        break;
    }
    _showalert(context, _value4);
  }
  Future _showalert(BuildContext context,String Aalert) async
  {
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: new Text(Aalert),
            actions: <Widget>[
              new FlatButton(onPressed: ()=> Navigator.pop(context), child: new Text("Close"))
            ],
          );
        }
    );
  }
  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: <Widget>[
                new Text("This is BottomSheet", style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text("Close"),),
              ],
            ),
          );
        }
    );
  }
  List<BottomNavigationBarItem> _items;
  String _values = " ";
  int _index = 0;

  @override
  void initState() {
    _items = new List();
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.account_circle), title: new Text('Account Circle')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.account_box), title: new Text('Account Box')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.account_balance), title: new Text('Account Balance')));
  }
  String _value=" ";
  bool _value1 = false;
  double _value2 = 0.0;
  int _value3 =0;

  void _forSlider(double value)
  {
    setState(() {
      _value2=value;
      if(value==0.0)
        {
          _value=" ";
        }
    });
  }
  void _forRadio(int value)
  {
    setState(() {
      _value3=value;
      if(value == 1) {
        _value = " ";
      }
    });
  }

  void _onChanged(bool value)
  {
    setState(() {
      _value1 = value;
      if(value == false) {
        _value = " ";
      }
    });
  }

  void _onSubmitted(String value)
  {
    setState(() {
      _value = value;
    });
  }

  Widget makeRadio()
  {
    List<Widget> list = new List<Widget>();
    for(int i=0;i<2;i++) {
      list.add(new Radio(value: i, groupValue: _value3, onChanged: _forRadio));
    }
    Column column = new Column(children: list);
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello world"),
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: ()=> _value3++),
          new IconButton(icon: new Icon(Icons.remove), onPressed: ()=>_value3--),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=> _onChanged(false),
        backgroundColor: Colors.red,
        mini: true,
        child: new Icon(Icons.remove_circle_outline),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new RaisedButton(onPressed: ()=> _showalert(context,"Error : Something Went Wrong"),child: new Text("Alert"),),
              new FlatButton(onPressed: ()=> _showBottom, child: new Text("Show Bottom Sheet")),
              new IconButton(icon: new Icon(Icons.refresh), onPressed: ()=> _onSubmitted(_value),tooltip: "Refresh",),
              new CheckboxListTile(
                value: _value1,
                onChanged: _onChanged,
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.platform,
                title: new Text("Reset"),
              ),
              new SwitchListTile(
                value: _value1,
                onChanged: _onChanged,
                activeColor: Colors.green,
                dense: _value1,
                title: new Text("Reset"),
              ),
              new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Close Drawer'),)
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.add), onPressed: ()=>_value3++),
        new IconButton(icon: new Icon(Icons.remove), onPressed: ()=>_value3--),
        new RaisedButton(onPressed: _askUser,child: new Text("Review"),)
      ],
      body: new Container(
        padding: const EdgeInsets.all(12.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Card(
                child: new Text("Hello ${_value}"),
              ),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "Name",
                  hintText: "Ex. Jhon",
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onSubmitted: _onSubmitted,
                onChanged: _onSubmitted,
              ),
              new Padding(padding: new EdgeInsets.all(12.0)),
              new Text(((_value2*100).round()).toString()),
              new Slider(value: _value2, onChanged: _forSlider,activeColor: Colors.green,),
              new Expanded(child: makeRadio()),
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