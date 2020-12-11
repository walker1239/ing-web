import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/models/products/members.dart';
// import model
import 'package:prueba_mvc/models/products/products_model.dart';

class ProductsController {
  ProductsController();
  
  void getter(BuildContext context) {
    ProductsModel viewModel = Provider.of<ProductsModel>(context, listen: false);
    
    viewModel.getter();
    
  }

  void setter(BuildContext context,Members miembro) {
    ProductsModel viewModel = Provider.of<ProductsModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter(miembro);
  }

  void update(BuildContext context,Members miembro) {
    ProductsModel viewModel = Provider.of<ProductsModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update(miembro);
  }

  void remove(BuildContext context,Members miembro) {
    ProductsModel viewModel = Provider.of<ProductsModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove(miembro);
  }
}