import 'package:flutter/material.dart';

enum RolesModelStatus {
  Ended,
  Loading,
  Error,
}

class RolesModel extends ChangeNotifier {
  RolesModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  RolesModelStatus get status => _status;

  RolesModel();

  RolesModel.instance() {
    //TODO Add code here
  }
  
  void getter() {
    _status = RolesModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = RolesModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
    _status = RolesModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = RolesModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = RolesModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = RolesModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = RolesModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = RolesModelStatus.Ended;
    notifyListeners();
  }
}