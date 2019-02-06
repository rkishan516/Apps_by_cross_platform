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
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  calculator(String buttonText){
    if(buttonText == "C"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if(buttonText == "."){
      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "*"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  Widget buildButton(String Number){
    return new Container(
      padding: new EdgeInsets.only(bottom: 16.0),
      child: new CircleAvatar(
        radius: 20.0,
        child: new FlatButton(onPressed: () => calculator(Number), child: new Text(Number, style: new TextStyle(color: Colors.white),)),
      ),
    );
  }
  Widget buildSection(String Sign, String First, String Second,String Third){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildButton(Third),
        buildButton(Second),
        buildButton(First),
        buildButton(Sign)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
          child: new Column(
            children: <Widget>[
              new Align(alignment: Alignment.centerRight,
                  child: new Padding(padding: new EdgeInsets.all(40.0),
                  child: new Text(output,
                    style: new TextStyle(
                      fontSize: 40.0
                    ),
                  )
                  )
              ),
              new Expanded(child: new Divider()),
              buildSection('+', '9', '8', '7'),
              buildSection('-', '6', '5', '4'),
              buildSection('*', '3', '2', '1'),
              buildSection('/', '0', '00', '.'),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildButton('C'),
                  buildButton('=')
                ],
              )
            ],
          )
      ),
    );
  }
}