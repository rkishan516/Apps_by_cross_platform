import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget titlesection = new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Text("Strawberry Pavlova",
          style: new TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w800,
            fontSize: 30.0,
            letterSpacing: 0.5
          ),
      ),
    );
      var Datasection = new Text("Palvova is a maringue-based\ndessert named after the Russian\nballerine Anna Palvova.\n"
      "Palvova featues a crisp crust and\nsoft, light inside, topped with fruit\nand whipped cream.",
        textAlign: TextAlign.center,
      style: new TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25.0,
        ),
      );
      Widget ratingsection = new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.star,color: Colors.green,),
                new Icon(Icons.star,color: Colors.green,),
                new Icon(Icons.star,color: Colors.green,),
                new Icon(Icons.star,color: Colors.grey,),
                new Icon(Icons.star,color: Colors.grey,),
              ],
            ),
            new Text ("170 Reviews"),
          ],
        ),
      );
      Widget worksection = new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Icon(Icons.kitchen,color: Colors.green,),
                new Text("PREP:"),
                new Text("25 MIN"),
              ],
            ),

            new Column(
              children: <Widget>[
                new Icon(Icons.timer,color: Colors.green,),
                new Text("COOK:"),
                new Text("1 hr"),
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.restaurant,color: Colors.green,),
                new Text("FEEDS:"),
                new Text("4-6"),
              ],
            ),
          ],
        ),
      );
      Widget leftpart = new Container(
        padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
        child: new Column(
          children: <Widget>[
            titlesection,
            Datasection,
            ratingsection,
            worksection,
          ],
        ),
      );
      Widget rightpart = new Image.asset('Images/pavlova.jpg',fit: BoxFit.cover,);

    return new MaterialApp(
        title: "basic app",
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: new Scaffold(
            appBar: new AppBar(
              title: new Center(child: new Text("Strawberry Pavlova Recipe"),),
            ),
            body : new Center(
              child: new Container(
                margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
                height: 600.0,
                child: new Card(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        width: 400.0,
                        child: leftpart,
                      ),
                      rightpart,
                    ],
                  ),
                ),
              ),
            )
        ),
    );
  }
}
