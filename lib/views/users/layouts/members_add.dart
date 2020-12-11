
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/controllers/products/products_controller.dart';
import 'package:prueba_mvc/controllers/users/users_controller.dart';
import 'package:prueba_mvc/languages/languages.dart';
import 'package:prueba_mvc/models/products/members.dart';
import 'package:prueba_mvc/models/products/products_model.dart';
import 'package:prueba_mvc/models/users/users_model.dart';
import 'package:prueba_mvc/models/users/usersf.dart';


class FormMaterial extends StatelessWidget {
  final UserF miembro;
  final roles;
  final String tipo;
  FormMaterial({this.miembro,this.tipo,this.roles});
  @override
  Widget build(BuildContext context) {

    UsersController viewController = UsersController();
    return ChangeNotifierProvider<UsersModel>(
      create: (context) => UsersModel.instance(),
      child: Consumer<UsersModel>(
        builder: (context, viewModel, child) {
          
          return FormMaterial1(miembro1: miembro,tipo1: tipo,roles1: roles,);
        },
      ),
    );
  }
}

class FormMaterial1 extends StatefulWidget {
  final UserF miembro1;
  final roles1;
  final String tipo1;
  FormMaterial1({this.miembro1,this.tipo1, this.roles1});
  @override
  _FormMaterialState createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial1> {
  final _formKey = GlobalKey<FormState>();
  //final _user = User();
  final nombreController= TextEditingController(); 
  final contrasenaController= TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    UsersController viewController = UsersController();
    final viewModel = Provider.of<UsersModel>(context);
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
                            
                            TextFormField(
                              readOnly: widget.tipo1=="add"?false:true,
                              controller:nombreController..text=widget.miembro1.email
                              ,
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                              ),
                              decoration: InputDecoration(
                                labelText: "email".tr,
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
                            widget.tipo1=="add"?
                            TextFormField(
                              controller:contrasenaController
                              ,
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                              ),
                              decoration: InputDecoration(
                                labelText: "password".tr,
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "names_form_error".tr;
                                }
                              },
                              onSaved: (val) =>{}
                                  //setState(() => _user.firstName = val),
                            ):null,
                            DropdownButton<String>(
                              items: new List.generate(widget.roles1.length, (int index) {
                                return DropdownMenuItem<String>(
                                  value: widget.roles1[index].name,
                                  child: Text( widget.roles1[index].name, style: TextStyle(
                                fontSize:20
                              ),),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  widget.miembro1.rol=value;
                                });
                              },
                              value: widget.miembro1.rol.isEmpty?"members":widget.miembro1.rol,
                            ),
                            CheckboxListTile(
                              title: Text("active".tr),
                              value: widget.miembro1.actived,
                              onChanged: (newValue) { 
                                          setState(() {
                                            widget.miembro1.actived = newValue; 
                                          }); 
                                        },
                              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
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
                                        
                                        UserF temp= UserF(actived: widget.miembro1.actived,rol: widget.miembro1.rol,email: nombreController.text);
                                        //print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                        //print(apellidoController.text);
                                        if(widget.tipo1=="add"){

                                          viewController.setter(context,temp,contrasenaController.text);
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