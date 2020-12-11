import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:prueba_mvc/models/roles/roles_model.dart';
// import controller
import 'package:prueba_mvc/controllers/roles/roles_controller.dart';

class RolesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RolesController viewController = RolesController();
    return ChangeNotifierProvider<RolesModel>(
      create: (context) => RolesModel.instance(),
      child: Consumer<RolesModel>(
        builder: (context, viewModel, child) {
          return Container(
              //TODO Add layout or component here
              );
        },
      ),
    );
  }
}