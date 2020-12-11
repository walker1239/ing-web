import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class RolesF extends ChangeNotifier {


  String id;
  String name;

  //List<String> instrumentos;
  RolesF({this.id,this.name});

  factory RolesF.fromJson(Map<String, dynamic> json) {
    return RolesF(
      id: json['id'] as String,
      name: json['name'] as String,

    );
  }

  RolesF.fromMap(Map snapshot,String id) :
        id = id ?? '',
        name = snapshot['name'] ?? '';

  toJson() {
    return {
      "name": name,
    };
  }

  static List<RolesF> parseMembers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<RolesF>((json) => RolesF.fromJson(json)).toList();
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