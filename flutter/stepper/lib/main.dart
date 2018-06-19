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
  List<Step> _steps;
  int _counter;


  @override
  void initState() {
    _counter=0;
    _steps = <Step>[
      new Step(title: new Text("Step 1"),
          content: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Ex. Abc",
                    labelText: "Name",
                    icon: new Icon(Icons.contacts)
                  ),
                )
              ],
            ),
          ),
          isActive: true
      ),
      new Step(title: new Text("Step 2"), content: new Text("Do SomeThing"),isActive: true),
      new Step(title: new Text("Step 3"), content: new Text("Do SomeThing"),isActive: true),
    ];
  }
  void _stepCancel()
  {
    setState(() {
      _counter--;
      if(_counter<0)
        _counter=0;
    });
  }
  void _stepContinue()
  {
    setState(() {
      _counter++;
      if(_counter>=_steps.length)
        _counter = _steps.length-1;
    });
  }
  void _onTap(int index)
  {
    setState(() {
      _counter= index;
    });
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
          child: new Stepper(
              steps: _steps,
              currentStep: _counter,
              onStepCancel: _stepCancel,
              onStepContinue: _stepContinue,
              onStepTapped: _onTap,
          ),
          )
        ),
      );
  }
}