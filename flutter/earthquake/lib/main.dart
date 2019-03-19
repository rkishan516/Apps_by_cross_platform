import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _earthQuake createState() => _earthQuake();
}

class _earthQuake extends State<MyApp>{

  List<Earthquake> list = new List<Earthquake>();
  int count;

  String link = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnitude=7';
  Future<Earthquake> getData() async{
      http.Response response = await http.get(link);
      if (response.statusCode == 200) {
         var earthquakesDetail = json.decode(response.body);
         count = earthquakesDetail['metadata']['count'];
         for(int i=0;i<count;i++){
           Earthquake eth = Earthquake.fromJson(earthquakesDetail['features'][i]);
           list.add(eth);
         }
      } else {
        throw Exception('Failed to load post');
      }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EarthQuake',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('EarthQuake'),
          leading: new Icon(Icons.leak_remove),
        ),
        body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new RaisedButton(onPressed: getData,child: new Text('Get First JSON')),
//                new ListView.builder(
//                    itemCount: count,
//                    itemBuilder: (BuildContext context,int index){
//                      return new ListTile(
//                        leading: new CircleAvatar(child: new Text(list[index].mag.toString()),),
//                        title: new Text(list[index].title),
//                        subtitle: new Text(list[index].Place),
//                      );
//                    }
//                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class Earthquake {
  var mag;
  String Place;
  String url;
  String title;

  Earthquake({this.mag, this.Place, this.url, this.title});

  factory Earthquake.fromJson(Map<dynamic, dynamic> json) {
    return Earthquake(
      mag: json['properties']['mag'],
      Place: json['properties']['place'],
      url: json['properties']['url'],
      title: json['properties']['title']
    );
  }
}