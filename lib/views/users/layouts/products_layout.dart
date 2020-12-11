import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/controllers/users/users_controller.dart';
import 'package:prueba_mvc/languages/languages.dart';
import 'package:prueba_mvc/models/products/members.dart';
// import model
import 'package:prueba_mvc/models/products/products_model.dart';
// import controller
import 'package:prueba_mvc/controllers/products/products_controller.dart';

import 'package:get/get.dart';
import 'package:prueba_mvc/models/users/users_model.dart';
import 'package:prueba_mvc/models/users/usersf.dart';

import 'members_add.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout();

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var tam;



  @override
  Widget build(BuildContext context) {
    tam=(MediaQuery.of(context).size.width);
    UsersController viewController = UsersController();
    final viewModel = Provider.of<UsersModel>(context);
    //viewController.getter(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewController.getter(context);
        },
        child: Icon(Icons.refresh),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          children: <Widget>[
            
            Container(
              height: 80,
              // margin: EdgeInsets.only(left: 200, right: 200),
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 16.0),
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  UserF temp=UserF(id: "",actived: true,email: "",rol: "members",uid: "");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormMaterial(miembro: temp,tipo: "add",roles: viewModel.roles,)),
                  );
                },
                child: Text(
                  "add".tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                )
              )
            ),
            (viewModel.status == UsersModelStatus.Loading)
            ? LinearProgressIndicator()
            : Container(),/**/
          (viewModel.status == UsersModelStatus.Error)
              ? Text(
                  viewModel.errorMessage,
                  //onPressed: () {
                  //  viewController.getter(context);
                  //},
                )
              : Container(),
              (viewModel.users.length==0)
              ? Container()
              :
            tableCard(
              tam,
              viewModel.users,
              viewController,
              viewModel
            ),
            
          ],
        ),
      ),
      /*Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          (viewModel.status == ProductsModelStatus.Loading)
              ? LinearProgressIndicator()
              : tableCard(
                context,
                viewModel.integrantes,
              ),
          (viewModel.status == ProductsModelStatus.Error)
              ? Text(
                  viewModel.errorMessage,
                  //onPressed: () {
                  //  viewController.getter(context);
                  //},
                )
              : Container(),
          //Expanded(
          //  flex: 1,
          //  child: GridView.builder(
          //    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //      crossAxisCount: 2,
          //    ),
          //    itemCount: viewModel.photos.length,
          //    itemBuilder: (context, index) {
          //      return PhotoCard(
          //        thumbnailUrl: viewModel.photos[index].thumbnailUrl,
          //      );
          //    },
          //  ),
          //),
        ],
      ),*/
    );
  }
  Widget tableCard(final width, List<UserF> data, UsersController viewController, final  viewModel) {
  return Card(
    elevation: 2.0,
    child: Column(children: [
      Container(
        width: width < 1300
            ? width - 100
            : width - 330,
        padding: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: Table(
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth((width / 6)),
            1: FixedColumnWidth((width / 6)),
            2: FixedColumnWidth((width / 6)),
            3: FixedColumnWidth((width / 6)),
            4: FixedColumnWidth((width / 6)),
          },
          children: [
            TableRow(decoration: BoxDecoration(), children: [
              Container(
                padding: EdgeInsets.all(18),
                child: Text(
                  "No.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Text(
                  "email".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Text(
                  "rol".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Text(
                  "active".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Text(
                  "actions".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
      Container(
        width: width < 1300
            ? width - 100
            : width - 330,
        // padding: EdgeInsets.all(32),
        child: Table(
            columnWidths: <int, TableColumnWidth>{
              0: FixedColumnWidth((width / 6)),
              1: FixedColumnWidth((width / 6)),
              2: FixedColumnWidth((width / 6)),
              3: FixedColumnWidth((width / 6)),
              4: FixedColumnWidth((width / 6)),
            },
            children: List<TableRow>.generate(data.length, (i) {
              return TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey))),
                  children: [
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        (i + 1).toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        data[i].email.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'HelveticaNeue',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        data[i].rol.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        data[i].actived.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Wrap(

                        children:[
                          RaisedButton(
                            child: Text("edit".tr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'HelveticaNeue',
                              ),
                            ),
                            shape: StadiumBorder(),
                            onPressed: (){   
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FormMaterial(miembro: data[i],tipo: "edit",roles: viewModel.roles)),
                              );                           
                            }
                          ),
                          RaisedButton(
                            child: Text("delete".tr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'HelveticaNeue',
                              ),
                            ),
                            shape: StadiumBorder(),
                            onPressed: (){ 
                              viewController.remove(context, data[i]);                 
                            }
                          ),
                        ],
                        //viewController.setter(
                        
                      ),
                    )
                  ]
                );
            })
            )
          ),
  
    ]),
  );
}

}