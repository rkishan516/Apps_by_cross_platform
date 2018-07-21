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
  MapController mapController;
  Map<String, LatLng> coords;
  List<Marker> markers;


  @override
  void initState() {
    mapController = new MapController();

    coords = new Map<String, LatLng>();
    coords.putIfAbsent("SVNIT", () => new LatLng(21.1674, 72.7851));
    coords.putIfAbsent("MNIT", () => new LatLng(26.8630,75.8106));
    coords.putIfAbsent("IITB", () => new LatLng(19.1334, 72.9133));

    markers = new List<Marker>();

    for(int i = 0; i < coords.length; i++) {
      markers.add(
          new Marker(
            width: 80.0,
            height: 80.0,
            point: coords.values.elementAt(i),
            builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red,),
          )
      );
    }
  }

  void _showCoord(int index) {
    mapController.move(coords.values.elementAt(index), 15.0);
  }

  List<Widget> _makeButtons() {
    List<Widget> list = new List<Widget>();

    for(int i = 0; i < coords.length; i++) {
      list.add(new RaisedButton(onPressed: () => _showCoord(i), child: new Text(coords.keys.elementAt(i)),));
    }
    return list;
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
              new Row(children:_makeButtons(),),
              new Flexible(
                  child: new FlutterMap(
                      mapController: mapController,
                      options: new MapOptions(
                        center: new LatLng(21.1674, 72.7851),
                        zoom: 10.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                          urlTemplate:"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a','b','c'],
                        ),
                        new MarkerLayerOptions(markers: markers),
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