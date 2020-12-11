import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:prueba_mvc/models/roles/roles_model.dart';

class RolesController {
  RolesController();
  
  void getter(BuildContext context) {
    RolesModel viewModel = Provider.of<RolesModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    RolesModel viewModel = Provider.of<RolesModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    RolesModel viewModel = Provider.of<RolesModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    RolesModel viewModel = Provider.of<RolesModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}