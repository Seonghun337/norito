import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SocialApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SocialApp();
}

class _SocialApp extends State<SocialApp> {
  // List<ChatRoom> chatList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  // final Future<String> _calculation = Future<String>.del
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                child: Center(
                    child: Column(children: <Widget>[
              Text("친구목록이 들어갈 자리"),
            ], mainAxisAlignment: MainAxisAlignment.center)))));
  }
}
