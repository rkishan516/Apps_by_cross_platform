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
      home: new MyHomePage(title: 'ListView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
List<Widget> list = <Widget>
[
  new ListTile(
    title: new Text("CineArts at the Empire"),
    subtitle: new Text("85 W Portel Ave"),
    leading: new Icon(Icons.theaters,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("The Castro Theater"),
    subtitle: new Text("429 Castro St"),
    leading: new Icon(Icons.theaters,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("Alamo Drafthouse Cinema"),
    subtitle: new Text("2550 Mission St"),
    leading: new Icon(Icons.theaters,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("Roxie Theater"),
    subtitle: new Text("3117 16th St"),
    leading: new Icon(Icons.theaters,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("United Artists Stonestown Twin"),
    subtitle: new Text("501 Buckingham Way"),
    leading: new Icon(Icons.theaters,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("AMC Metreon 16"),
    subtitle: new Text("135 4th St #3000"),
    leading: new Icon(Icons.theaters,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("K's Kitchen"),
    subtitle: new Text("757 Monterey Blvd"),
    leading: new Icon(Icons.restaurant,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("Emmy's Restaurant"),
    subtitle: new Text("1923 Ocean Ave"),
    leading: new Icon(Icons.restaurant,color: Colors.blue,),
  ),
  new ListTile(
    title: new Text("Chaiya Thai Restaurant"),
    subtitle: new Text("272 Calremont Blvd"),
    leading: new Icon(Icons.restaurant,color: Colors.blue,),
  ),
];

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      )
    );
  }
}
