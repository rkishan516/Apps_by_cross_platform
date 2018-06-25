import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

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

class Sales{
  int sales;
  String year;
  Sales(this.sales,this.year);
}
class _State extends State<MyApp>
{
  List<Sales> _laptop;
  List<Sales> _desktop;
  List<charts.Series<Sales,String>> _chartdata;

  void _makeData() {

    _laptop = new List<Sales>();
    _desktop = new List<Sales>();
    _chartdata = new List<charts.Series<Sales, String>>();

    final rnd = new Random();
    for(int i = 2016; i < 2019; i++) {
      _laptop.add(new Sales(rnd.nextInt(1000),i.toString()));
      _desktop.add(new Sales(rnd.nextInt(1000),i.toString()));
    }

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _laptop,
      domainFn: (Sales sales,__) => sales.year,
      measureFn: (Sales sales,__) => sales.sales,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
    ));

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _desktop,
      domainFn: (Sales sales,__) => sales.year,
      measureFn: (Sales sales,__) => sales.sales,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
    ));

  }


  @override
  void initState() {
    _makeData();
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
              new Text("Hello world"),
              new Expanded(child: new charts.BarChart<Sales>(
                _chartdata,
              ))
            ],
          ),
        ),
      ),
    );
  }
}