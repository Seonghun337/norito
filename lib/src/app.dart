import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:kakao_flutter_sdk/auth.dart';

import '../src/page/logincheck.dart';

class App extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    // KakaoContext.clientId = '71881d713efcac896b6cfef775ad6303';

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        if (snapshot.hasError){
          print(snapshot.toString());
          return Center(
            child: Text("서버에 연결할 수 없습니다."),
          );
        }
        if (snapshot.connectionState == ConnectionState.done){
          return LoginCheck();
        }

        return CircularProgressIndicator();
      }
    );
  }
}