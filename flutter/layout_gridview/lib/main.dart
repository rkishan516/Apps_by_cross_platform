import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState()=> new _MyHomePageState();
}

List<Container> _buildGridTileList(int count)
{
  List<Container> containers = new List<Container>.generate(
      count,
          (int index)=> new Container(child: new Image.asset('images/pic${index+1}.jpg')),
  );
  return containers;
}

Widget buildGrid()
{
  return new GridView.extent(
    maxCrossAxisExtent: 150.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
  );
}
class _MyHomePageState extends State<MyHomePage>
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView"),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}