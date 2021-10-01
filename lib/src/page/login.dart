import 'package:flutter/material.dart';

// import 'package:kakao_flutter_sdk/auth.dart';
// import 'package:kakao_flutter_sdk/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:norito_app/src/page/home.dart';
// import 'package:norito_app/model/user.dart';

import '../page/home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController idController = new TextEditingController();
  TextEditingController pwController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("로그인"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: Container(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      controller: idController,
                      decoration: InputDecoration(labelText: '아이디(이메일)'),
                    ),
                    TextField(
                      controller: pwController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: '비밀번호'),
                    ),
                    RaisedButton(
                        child: Row(children: <Widget>[
                          Text("로그인", textAlign: TextAlign.center),
                        ], mainAxisAlignment: MainAxisAlignment.center),
                        onPressed: () {
                          login();
                        })
                  ],
                ))));
  }

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: idController.text, password: pwController.text);
      print("Login Success");
      Navigator.of(context).pop();
    }on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found'){
        print('No user found for that email.');
      }else if (e.code == 'wrong-password'){
        print('Wrong password provided for that user');
      }else{
        print('What the fuck');
      }
    }
    // FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: idController.text, password: pwController.text);
  }

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }
// void loginWithKakao() async {
//   // try {
//   //   await UserApi.instance.loginWithKakaoTalk();
//   // }catch(e){
//   //   print("error on login: $e");
//   // }
//   try {
//     final installed = await isKakaoTalkInstalled();
//     installed
//         ? await UserApi.instance.loginWithKakaoTalk()
//         : await UserApi.instance.loginWithKakaoAccount();
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (BuildContext context) => Home()),
//         (route) => false);
//   } catch (e) {
//     print("error on login: $e");
//   }
// }
}
