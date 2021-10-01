import 'package:flutter/material.dart';


// 다시 설계 필요
class User {
  String uid;
  String? nickname;
  String? birthday;
  String? sex;



  User({
    required this.uid,
    @required this.nickname,
    @required this.birthday,
    @required this.sex,
  });

}