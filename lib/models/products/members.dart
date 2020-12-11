import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Members extends ChangeNotifier {


  String id;
  String nombres;
  String apellidos;
  //List<String> instrumentos;
  Members({this.id, this.nombres, this.apellidos});

  factory Members.fromJson(Map<String, dynamic> json) {
    return Members(
      id: json['id'] as String,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
    );
  }

  Members.fromMap(Map snapshot,String id) :
        id = id ?? '',
        nombres = snapshot['nombres'] ?? '',
        apellidos = snapshot['apellidos'] ?? '';

  toJson() {
    return {
      "apellidos": apellidos,
      "nombres": nombres,
    };
  }

  static List<Members> parseMembers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Members>((json) => Members.fromJson(json)).toList();
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