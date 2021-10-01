import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/chatroom.dart';
import '../../model/message.dart';

class ChatRoom extends StatefulWidget {
  // CollectionReference ref;
  DocumentReference room_doc;

  ChatRoom({required this.room_doc});

  @override
  State<StatefulWidget> createState() => _ChatRoom(room_doc: this.room_doc);
}

class _ChatRoom extends State<ChatRoom> {
  final DocumentReference room_doc;
  List<String> messages = List.empty(growable: true);
  String nickname = 'abc';

  // = FirebaseFirestore.instance.collection();

  TextEditingController? _editingController;
  ScrollController? _scrollController;

  _ChatRoom({required this.room_doc});

  @override
  void initState() {
    super.initState();
    _editingController = new TextEditingController();
    _scrollController = new ScrollController();

    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    users
        .where('uid', isEqualTo: user!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        nickname = doc["nickname"];
      });
    });

    final msgRef = room_doc.collection('messages').withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson(),
        );
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> messageStream =
        room_doc.collection('messages').snapshots();

    return Container(
        child: Center(
            child: Column(
      children: <Widget>[
        StreamBuilder<QuerySnapshot>(
            stream: messageStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("메세지를 불러오는데에 에러가 발생하였습니다.");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              // return Column(
              //   children: <Widget>[
              //     SizedBox(
              //         height: 200.0,
              //         child: ListView(
              //       children: snapshot.data!.docs
              //           .map((DocumentSnapshot document) {
              //         Map<String, dynamic> data =
              //             document.data()! as Map<String, dynamic>;
              //         return Card(
              //             child: Padding(
              //                 padding:
              //                     EdgeInsets.fromLTRB(20, 20, 20, 20),
              //                 child: Text(data['body'])));
              //       }).toList(),
              //       controller: _scrollController,
              //       // scrollDirection: Axis.vertical,
              //     )),
              //   ],
              //   mainAxisAlignment: MainAxisAlignment.end,
              // );
              return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Card(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Text(data['body'])));
                  }).toList(),
                  controller: _scrollController,
                  shrinkWrap: true
                  // scrollDirection: Axis.vertical,
                  );
            }),
        Padding(
            child: TextFormField(
              controller: _editingController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54))),
              //슬라이드해서 밀려 올라가는 인터페이스
            ),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5)),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            String message = _editingController!.text;
            sendMessage(message);
          },
        )
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    )));
  }

  Future<void> sendMessage(String message) async {
    await room_doc.collection('messages').add(
          Message(body: message, sender: nickname).toJson(),
        );
  }
}
