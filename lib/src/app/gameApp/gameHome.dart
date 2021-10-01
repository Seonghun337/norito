import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GameApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GameApp();
}

class _GameApp extends State<GameApp> {
  // List<ChatRoom> chatList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                child: Center(
              child: Column(children: <Widget>[
                Text("hi"),
                IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    })
              ], mainAxisAlignment: MainAxisAlignment.center),
              //   Text("게임이 들어갈 자리"),
              //   RaisedButton(
              //       child: Text("로그아웃"),
              //       onPressed: () {
              //         FirebaseAuth.instance.signOut();
              //       })
              // ])
              // child: ListView.builder(
              //   itemBuilder: (context, position){
              //     return Card(
              //         child: Padding(
              //           padding: EdgeInsets.fromLTRB(10,10,10,20),
              //           child: Row(
              //             children: <Widget>[
              //               Text(
              //                   "\t\t\t${chatList[position].opponent} \t | \t ${chatList[position].recentMessage}"
              //               ),
              //             ],
              //             mainAxisAlignment: MainAxisAlignment.start,
              //           ),
              //         )
              //     );
              //   },
              //   itemCount: chatList.length,
              // )
            ))));
  }
}
