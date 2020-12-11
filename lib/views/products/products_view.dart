import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:prueba_mvc/models/products/products_model.dart';
// import controller
import 'package:prueba_mvc/controllers/products/products_controller.dart';
import 'package:prueba_mvc/views/products/layouts/products_layout.dart';

class ProductsView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    ProductsController viewController = ProductsController();
    return ChangeNotifierProvider<ProductsModel>(
      create: (context) => ProductsModel.instance(),
      child: Consumer<ProductsModel>(
        builder: (context, viewModel, child) {
          
          return HomeLayout();
        },
      ),
    );
  }
}