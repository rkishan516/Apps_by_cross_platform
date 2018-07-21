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
    var markers = <Marker>[
      new Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(21.1674, 72.7851),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red,)
      ),
      new Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(26.8630,75.8106),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red,)
      ),
      new Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(19.1334, 72.9133),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red,)
      ),
    ];
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
                        center: new LatLng(19.1334, 72.9133),
                        zoom: 10.0
                    ),
                    layers: [
                      new TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a','b','c'],
                      ),
                      new MarkerLayerOptions(markers: markers)
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}