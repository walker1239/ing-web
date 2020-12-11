import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:prueba_mvc/models/users/users_model.dart';
// import controller
import 'package:prueba_mvc/controllers/users/users_controller.dart';

import 'layouts/products_layout.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersController viewController = UsersController();
    return ChangeNotifierProvider<UsersModel>(
      create: (context) => UsersModel.instance(),
      child: Consumer<UsersModel>(
        builder: (context, viewModel, child) {
          return HomeLayout();
        },
      ),
    );
  }
}