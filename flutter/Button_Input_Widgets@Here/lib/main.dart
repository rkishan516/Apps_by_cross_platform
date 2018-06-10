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
  String _value = "Hello World";
  bool _value1 =false;
  double _value2 = 0.0;

  void _onChanged(bool value)=> setState(()=> _value1 =value);
  void _onChanged2(double value)=> setState(()=> _value2 = value);

  void _onPressed()
  {
    setState(() {
      if(_value == "Hello World")
        {
          _value = "Hey Dude";
        }
        else
          {
            _value = "Hello World";
          }
    });
  }
  void _onSubmitted(String value)
  {
    setState(() {
      _value = "Hello ${value}";
    });
  }
  Widget radiolist()
  {
    List<Widget> list = new List<Widget>();
    for(int i=0;i<2;i++)
      list.add(new Radio(value: i, groupValue: _value1, onChanged: null),);

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
              new Text(_value),
              new RaisedButton(onPressed: _onPressed, child: new Text("Click Me"),textColor: Colors.green,),
              new FlatButton(onPressed: _onPressed, child: new Text("Click Me"),textColor: Colors.green,),
              new IconButton(icon: new Icon(Icons.sync), onPressed: _onPressed),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "Name",
                  hintText: "Ex.abc",
                  icon: new Icon(Icons.chat)
                ),
                autofocus: true,
                autocorrect: true,
                keyboardType: TextInputType.text,
                onSubmitted: _onSubmitted,
              ),
              new Checkbox(value: _value1, onChanged: _onChanged),
              new CheckboxListTile(value: _value1,
                onChanged: _onChanged,
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.leading,
                secondary: new Icon(Icons.save),
                title: new Text("Click Here to Save"),
              ),
              new Switch(value: _value1, onChanged: _onChanged),
              new SwitchListTile(value: _value1,
                  onChanged: _onChanged,
                  activeColor: Colors.green,
                  title: new Text("This is Switch"),
                  secondary: new Icon(Icons.straighten),
              ),
              new Text("Value : ${(_value2*100).round()}"),
              new Slider(value: _value2, onChanged: _onChanged2),
            ],
          ),
        ),
      ),
    );
  }
}