import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';

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
  String status;
  Permission permission;


  @override
  void initState() {
    super.initState();
    status = 'Select an item';
    print(Permission.values);
  }

  requestPermission() async {
    bool res = await SimplePermissions.requestPermission(permission);
    print('Permissiosn result is ${res.toString()}');

    setState(() {
      status = '${permission.toString()} = ${res.toString()}';
    });
  }

  checkPermission() async {
    bool res = await SimplePermissions.checkPermission(permission);
    print('Permissiosn result is ${res.toString()}');

    setState(() {
      status = '${permission.toString()} = ${res.toString()}';
    });
  }

  getPermissionStatus() async {
    final res = await SimplePermissions.getPermissionStatus(permission);
    print('Permissiosn result is ${res.toString()}');

    setState(() {
      status = '${permission.toString()} = ${res.toString()}';
    });
  }

  onDropDownChanged(Permission permission) {
    setState(() {
      this.permission = permission;
      status = 'Click a button below';
    });
    print(permission);

  }

  List<DropdownMenuItem<Permission>> _getDropDownItems() {
    List<DropdownMenuItem<Permission>> items = new List<DropdownMenuItem<Permission>>();
    Permission.values.forEach((permission) {
      var item = new DropdownMenuItem(child: new Text(getPermissionString(permission)), value: permission,);
      items.add(item);
    });

    return items;
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
              new Text("Hello World"),
              new Text(status),
              new DropdownButton(items: _getDropDownItems(),value: permission, onChanged: onDropDownChanged),
              new RaisedButton(onPressed: checkPermission, child: new Text('Check Permission'),),
              new RaisedButton(onPressed: requestPermission, child: new Text('Request Permission'),),
              new RaisedButton(onPressed: getPermissionStatus, child: new Text('Get Status'),),
              new RaisedButton(onPressed: SimplePermissions.openSettings, child: new Text('Open Settings'),),
            ],
          ),
        ),
      ),
    );
  }
}