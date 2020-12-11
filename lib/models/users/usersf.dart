import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UserF extends ChangeNotifier {


  String id;
  String uid;
  String email;
  String rol;
  bool actived;
  //List<String> instrumentos;
  UserF({this.id,this.actived,this.email,this.rol,this.uid});

  factory UserF.fromJson(Map<String, dynamic> json) {
    return UserF(
      id: json['id'] as String,
      uid: json['uid'] as String,
      email: json['email'] as String,
      rol: json['rol'] as String,
      actived: json['active'] as bool,
    );
  }

  UserF.fromMap(Map snapshot,String id) :
        id = id ?? '',
        uid = snapshot['uid'] ?? '',
        email = snapshot['email'] ?? '',
        rol = snapshot['rol'] ?? '',
        actived = snapshot['active'] ?? '';

  toJson() {
    return {
      "email": email,
      "rol": rol,
      "uid": uid,
      "active": actived,
    };
  }

  static List<UserF> parseMembers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<UserF>((json) => UserF.fromJson(json)).toList();
  }

  static Future<String> fetchMembers() async {
    
    /*.reference()
    .child("tables")
    .child("integrantes")
    .child("wmanrique").once().then((DataSnapshot snap){

      var keys = snap.value.keys;
      var data = snap.value;
      for (var key in keys) {

        print(data[key]['nombres']);
        print("hola");
      }
    });*/
    /*_todoQuery.onValue.listen ((Event event) {
        print(event.snapshot.value);
    }, onError: (Object o) {
      final DatabaseError error = o;
      
      print(error.toString());
      
    });
    print(_todoQuery.toString());*/
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");

    
  }

}