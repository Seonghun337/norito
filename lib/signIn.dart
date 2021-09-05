import 'package:flutter/material.dart';
import 'dart:async';


class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  @override
  void initState() {
    super.initState();
  }

  // Future<Timer> loadData() async {
    // return Timer(Duration(seconds: 2), onDoneLoading);
  // }

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
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: RaisedButton(
                            child: Row(children: <Widget>[
                              Text("카카오로 로그인", textAlign: TextAlign.center),
                            ], mainAxisAlignment: MainAxisAlignment.center),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MainPage()),
                                      (route) => false);
                            })),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: RaisedButton(
                            child: Row(children: <Widget>[
                              Text("로그인하기", textAlign: TextAlign.center),
                            ], mainAxisAlignment: MainAxisAlignment.center),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MainPage()),
                                      (route) => false);
                            })),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: RaisedButton(
                            child: Row(children: <Widget>[
                              Text("회원가입", textAlign: TextAlign.center),
                            ], mainAxisAlignment: MainAxisAlignment.center),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MainPage()),
                                      (route) => false);
                            })),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))));
  }
}
