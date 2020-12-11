import 'package:flutter/material.dart';
import 'package:prueba_mvc/models/roles/usersf.dart';
import 'package:prueba_mvc/models/users/usersf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_mvc/utils/authentication.dart';

enum UsersModelStatus {
  Ended,
  Loading,
  Error,
}

class UsersModel extends ChangeNotifier {
  UsersModelStatus _status;
  String _errorCode;
  String _errorMessage;

  List <UserF> _users= [];
  List<UserF> get users => _users;

  

  List <RolesF> _roles= [];
  List<RolesF> get roles => _roles;


  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  UsersModelStatus get status => _status;

  UsersModel();

  UsersModel.instance() {
    //TODO Add code here
  }
  
  Future<void> getter() async {
    _status = UsersModelStatus.Loading;
    notifyListeners();

    Query query =FirebaseFirestore.instance.collection('users');
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    var result = await query.get();
    
    _users = result.docs
        .map((doc){ 
          print(doc.data().toString());
          return UserF.fromMap(doc.data(), doc.id);})
        .toList();

    Query query2 =FirebaseFirestore.instance.collection('roles');
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    var result2 = await query2.get();
    
    _roles = result2.docs
        .map((doc){ 
          print(doc.data().toString());
          return RolesF.fromMap(doc.data(), doc.id);})
        .toList();
    

    _status = UsersModelStatus.Ended;
    notifyListeners();
  }

  Future<void> setter(UserF user, String pass) async {
    _status = UsersModelStatus.Loading;
    notifyListeners();
    String uid = await registerWithEmailPassword(user.email,pass);
    if(uid!=null){
      user.uid=uid;
      FirebaseFirestore.instance.collection('users').add(user.toJson());
    }
    
    
    _status = UsersModelStatus.Ended;
    notifyListeners();
  }

  void update(UserF user) {
    _status = UsersModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = UsersModelStatus.Ended;
    notifyListeners();
  }

  void remove(UserF user) {
    _status = UsersModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = UsersModelStatus.Ended;
    notifyListeners();
  }
}