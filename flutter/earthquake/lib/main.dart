
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _earthQuake createState() => _earthQuake();
}

class _earthQuake extends State<MyApp> {

  @override
  void initState(){
    getData();
  }

  void _launch(String urlString)async{
    if(await canLaunch(urlString)){
        await launch(urlString);
    }else{
        throw "Can't Process launch url";
    }
  }

  List<Earthquake> _list = new List<Earthquake>();
  int _count = 0;
  String link = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&minmagnitude=5';

  Future<Earthquake> getData() async {
    http.Response response = await http.get(link);
    if (response.statusCode == 200) {
      var earthquakesDetail = json.decode(response.body);
      _count = earthquakesDetail['metadata']['count'];
      for (int i = 0; i < _count; i++) {
        Earthquake eth = Earthquake.fromJson(earthquakesDetail['features'][i]);
        setState(()=>  _list.add(eth));
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
            child:  new ListView.builder(
                   itemCount: _count,
                   itemBuilder: (BuildContext context,int index){
                     return new ListTile(
                       leading: new CircleAvatar(child: new Text(_list[index].mag.toString()),backgroundColor: (_list[index].mag > 6) ? Colors.red : Colors.green),
                       title: new Text(_list[index].title),
                       subtitle: new Text(_list[index].Place),
                       onTap: () => _launch(_list[index].url),
                     );
                   }
               )
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
        title: json['properties']['title']);
  }
}
