import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

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
  void _launchUrl()
  {
    _launch('http://www.google.com');
  }
  void _launchEmail()
  {
    _launch('mailto:Google@gmail.com');
  }
  void _launchSms()
  {
    _launch('sms:999-999-9999');
  }
  void _launchTel()
  {
    _launch('tel:999-999-9999');
  }
  void _launch(String urlString)async
  {
    if(await canLaunch(urlString))
      {
        await launch(urlString);
      }
      else{
        throw "Can't Process launch url";
    }
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text("Hello world"),
              new RaisedButton(onPressed: _launchUrl,child: new Text("Url"),),
              new RaisedButton(onPressed: _launchEmail,child: new Text("Email"),),
              new RaisedButton(onPressed: _launchSms,child: new Text("Sms"),),
              new RaisedButton(onPressed: _launchTel,child: new Text("Phone"),),
            ],
          ),
        ),
      ),
    );
  }
}
