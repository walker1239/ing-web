import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:prueba_mvc/models/users/users_model.dart';
import 'package:prueba_mvc/models/users/usersf.dart';

class UsersController {
  UsersController();
  
  void getter(BuildContext context) {
    UsersModel viewModel = Provider.of<UsersModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context,UserF user, String pass) {
    UsersModel viewModel = Provider.of<UsersModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter(user, pass);
  }

  void update(BuildContext context,UserF user) {
    UsersModel viewModel = Provider.of<UsersModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update(user);
  }

  void remove(BuildContext context,UserF user) {
    UsersModel viewModel = Provider.of<UsersModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove(user);
  }
}