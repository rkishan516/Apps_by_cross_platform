import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

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


  @override
  void initState() {
    status = "Not Authanticated";
  }

  void _signInAnon() async {
    FirebaseUser user = await _auth.signInAnonymously();
    if(user != null && user.isAnonymous == true) {
      setState(() {
        status = "Wow! You Get SignIn Succesfully";
      });
    }else{
      setState(() {
        status = "Oh! SignIn Failed, Please Try Again";
      });
    }
  }

  void _signInGoogle() async{
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final FirebaseUser user = await _auth.signInWithGoogle(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    if(user != null && user.isAnonymous == false){
      setState(() {
        status = "Wow! You Get SignIn with Google Succesfully ";
      });
    }else{
      setState(() {
        status = "Oh! SignIn Failed With Google, Please Try Again";
      });
    }
  }

  void _signOut() async {
    await _auth.signOut();
    setState(() {
      status = "You Get SignOut Succesfully, Come Again Soon";
    });
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
              new Text(status),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(onPressed: _signInAnon,child: new Text("SignIn"),),
                  new RaisedButton(onPressed: _signOut,child: new Text("SignOut"),),
                  new RaisedButton(onPressed: _signInGoogle,child: new Text("Google SignIn"),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}