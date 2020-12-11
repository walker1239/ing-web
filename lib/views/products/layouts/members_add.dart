
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/controllers/products/products_controller.dart';
import 'package:prueba_mvc/languages/languages.dart';
import 'package:prueba_mvc/models/products/members.dart';
import 'package:prueba_mvc/models/products/products_model.dart';


class FormMaterial extends StatelessWidget {
  final Members miembro;
  final String tipo;
  FormMaterial({this.miembro,this.tipo});
  @override
  Widget build(BuildContext context) {

    ProductsController viewController = ProductsController();
    return ChangeNotifierProvider<ProductsModel>(
      create: (context) => ProductsModel.instance(),
      child: Consumer<ProductsModel>(
        builder: (context, viewModel, child) {
          
          return FormMaterial1(miembro1: miembro,tipo1: tipo,);
        },
      ),
    );
  }
}

class FormMaterial1 extends StatefulWidget {
  final Members miembro1;
  final String tipo1;
  FormMaterial1({this.miembro1,this.tipo1});
  @override
  _FormMaterialState createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial1> {
  final _formKey = GlobalKey<FormState>();
  //final _user = User();
  final nombreController= TextEditingController(); 
  final apellidoController= TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    ProductsController viewController = ProductsController();
    final viewModel = Provider.of<ProductsModel>(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 2,
        margin: EdgeInsets.fromLTRB(64, 32, 64, 64),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(widget.miembro1.nombres),
                            TextFormField(

                              controller:nombreController..text=widget.miembro1.nombres
                              ,
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                              ),
                              decoration: InputDecoration(
                                labelText: "names".tr,
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "names_form_error".tr;
                                }
                              },
                              onSaved: (val) =>{}
                                  //setState(() => _user.firstName = val),
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                  labelText: "last_name".tr,
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                controller: apellidoController..text=widget.miembro1.apellidos,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "last_name_form_error".tr;
                                  }
                                },
                                onSaved: (val) =>{}
                                    //setState(() => _user.lastName = val)
                                ),
                          

                            Container(
                                height: 80,
                                // margin: EdgeInsets.only(left: 200, right: 200),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    color: Colors.blue,
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        Members temp= Members(apellidos: apellidoController.text,nombres: nombreController.text );
                                        //print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                        //print(apellidoController.text);
                                        if(widget.tipo1=="add"){
                                          viewController.setter(context,temp);
                                        }
                                        else{
                                          temp.id=widget.miembro1.id;
                                          viewController.update(context,temp);
                                        }
                                        /*_user.save();
                                        _showDialog(context);
                                        print(_user);
                                        print(_user.firstName);
                                      */
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text(
                                      "save".tr,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'HelveticaNeue',
                                      ),
                                    ))),
                          ])))),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}