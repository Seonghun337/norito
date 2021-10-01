import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app/chatApp/chatList.dart';
import '../app/gameApp/gameHome.dart';
import '../app/socialApp/socialList.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController? controller;


  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);

    User? user = FirebaseAuth.instance.currentUser;

    CollectionReference users = FirebaseFirestore.instance.collection('user');

    // users.where('uid', isEqualTo: user.uid).get().then();
    // print(userDoc);
    users.where('uid', isEqualTo: user!.uid).get().then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc){
        print(doc["nickname"]);
      });
    });
    // print(users.doc(user.uid).get()['nickname']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TabBarView(
          children: <Widget>[
            GameApp(),
            ChatApp(),
            SocialApp(),
          ],
          controller: controller,
        ),
        bottomNavigationBar: TabBar(tabs: <Tab>[
          Tab(
            icon: Icon(Icons.chat_bubble, color: Colors.blueAccent),
          ),
          Tab(
            icon: Icon(Icons.home_filled, color: Colors.blueAccent),
          ),
          Tab(
            icon: Icon(Icons.person, color: Colors.blueAccent),
          ),
        ], controller: controller),
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
