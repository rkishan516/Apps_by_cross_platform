import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:simple_permissions/simple_permissions.dart';

List<CameraDescription> cameras;
Permission permissionFromString(String value) {
  Permission permission;
  for(Permission item in Permission.values) {
    if(item.toString() == value) {
      permission = item;
      break;
    }
  }
  return permission;
}


void main()  async {

  cameras = await availableCameras();

  await SimplePermissions.requestPermission(permissionFromString('Permission.WriteExternalStorage'));
  await SimplePermissions.requestPermission(permissionFromString('Permission.Camera'));

  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  CameraController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Permission _permissionCamera;
  Permission _permissionStorage;

  @override
  void initState() {
    super.initState();

    controller = new CameraController(cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if(!mounted) return;
      setState(() {
        //Setting You want
      });
    });

    _permissionCamera = permissionFromString('Permission.Camera');
    _permissionStorage = permissionFromString('Permission.WriteExternalStorage');
  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  Future<String> saveImage() async {
    String timeStamp = new DateTime.now().millisecondsSinceEpoch.toString();
    String filePath = '/storage/emulated/0/Pictures/${timeStamp}.jpg';

    if(controller.value.isTakingPicture) return null;
    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      showInSnackBar(e.toString());
    }

    return filePath;
  }

  void takePicture() async {
    bool hasCamera = await SimplePermissions.checkPermission(_permissionCamera);
    bool hasStorage = await SimplePermissions.checkPermission(_permissionStorage);

    if(hasStorage == false || hasCamera == false) {
      showInSnackBar('Lacking permissions to take a picture!');
      return;
    }

    saveImage().then((String filePath) {
      if(mounted && filePath != null) showInSnackBar('Picture saved to ${filePath}');
    });

  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(onPressed: takePicture, child: new Text('Take Picture'),),
                      new RaisedButton(onPressed: SimplePermissions.openSettings, child: new Text('Settings'),),
                    ]),
                new AspectRatio(aspectRatio: 1.0, child: new CameraPreview(controller),)
              ],
            ),
          )
      ),
    );
  }


}