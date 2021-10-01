import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../model/chatroom.dart';
import './chatRoom.dart';

class ChatApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatApp();
}

class _ChatApp extends State<ChatApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child: Center(
                child: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(uid).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("서버 오류로 인해 채팅방을 불러올 수 없습니다.");
                    }

                    if (snapshot.hasData &&
                        snapshot.data!['chats'].length == 0) {
                      return Text("채팅방이 없습니다.");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      // 그리기
                      List<dynamic> chatRooms = snapshot.data!['chats'];

                      return ListView.builder(
                          itemBuilder: (context, position) {
                            return GestureDetector(
                                child: Card(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            child: Text("채팅방 ${position}"))
                                      ],
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatRoom(
                                                  room_doc: chatRooms[position]),
                                          fullscreenDialog: true));
                                });
                          },
                          itemCount: chatRooms.length);
                    }

                    return Text("채팅방을 불러오고 있습니다...");
                  },
                ))));
  }
}
