import 'package:flutter/material.dart';
import 'dart:async';

import './signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Norito',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: "Cabin",
        primaryColor: Color(0xffA3EEFF),
        primaryColorDark: Color(0xff0090E1),
        // primarySwatch: #cdc8f0,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(
      children: <Widget>[
        Text("ㄴㅗㄹㅣㅌㅓ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 41,
            )),
        // Text("책과 책이 만나는 공간",
        //     style: TextStyle(
        //       fontWeight: FontWeight.normal,
        //       fontSize: 20,
        //     )),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ))));
  }
}
