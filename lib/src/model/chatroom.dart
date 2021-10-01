import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 다시 설계 필요
class ChatRoom {
  // String? opponent_nickname;
  CollectionReference ref;

  ChatRoom({
    // @required this.participant,
    // @required this.messages
    required this.ref
  });

  // ChatRoom.fromSnapshot(DocumentSnapshot snapshot)
  // :ref = snapshot.

}