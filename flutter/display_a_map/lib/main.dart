import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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
              new Flexible(
                  child: new FlutterMap(
                    options: new MapOptions(
                      center: new LatLng(21.1674, 72.7851),
                      zoom: 15.0,
                    ),
                    layers: [
                      new TileLayerOptions(
                          urlTemplate:"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a','b','c'],
                      ),
                    ]
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}