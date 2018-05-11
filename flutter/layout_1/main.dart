import 'package:flutter/material.dart';

void main()=> runApp(new Myapp());

class Myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    Widget titlesection = new Container(
      padding: const EdgeInsets.all(35.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0,left: 0.0,right: 0.0,top: 0.0),
                    child: new Text('Oeschinen Lake Campground',style: new TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  new Text('Kandersteg, Switzerland',style: new TextStyle(color: Colors.grey[500]),),
                ],
              )
          ),
          new Icon(Icons.star, color: Colors.red,),
          new Text("41"),
        ],
      ),
    );
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
//
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    };
    Widget buttonsection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textsection = new Container(
        padding: const EdgeInsets.all(32.0),
      child:new Text("Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps."
              "Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes."
              "A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest,"
              "leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing,"
              "and riding the summer toboggan run.",softWrap: true,style: new TextStyle(fontSize: 20.0,color: Colors.black),),
    );
    return new MaterialApp(

      title: "basic app",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(child: new Text("First Basic App"),),
        ),
          body :new ListView(
                  children: <Widget>[
                    new Image.asset(
                      'images/lake.jpeg',
                      height: 240.0,
                      fit: BoxFit.cover,
                    ),
                    titlesection,
                    buttonsection,
                    textsection,
                  ],
                )
            )
      );
  }
}