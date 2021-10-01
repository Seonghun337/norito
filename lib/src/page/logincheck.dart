import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import './login.dart';
import '../page/home.dart';

class LoginCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginCheck();
}

class _LoginCheck extends State<LoginCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: RaisedButton(
                              child: Row(children: <Widget>[
                                Text("카카오로 로그인", textAlign: TextAlign.center),
                              ], mainAxisAlignment: MainAxisAlignment.center),
                              onPressed: () {
                                // loginWithKakao();
                              })),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: RaisedButton(
                              child: Row(children: <Widget>[
                                Text("로그인하기", textAlign: TextAlign.center),
                              ], mainAxisAlignment: MainAxisAlignment.center),
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Login()),
                                );
                              })),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: RaisedButton(
                              child: Row(children: <Widget>[
                                Text("회원가입", textAlign: TextAlign.center),
                              ], mainAxisAlignment: MainAxisAlignment.center),
                              onPressed: () {
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) => Login()),
                                //         (route) => false);
                              })),
                    ])
                    // Login();
                    );
              } else {
                return Home();
              }
            }));
  }
}
