import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/languages/languages.dart';
import 'package:prueba_mvc/models/products/members.dart';
// import model
import 'package:prueba_mvc/models/products/products_model.dart';
// import controller
import 'package:prueba_mvc/controllers/products/products_controller.dart';

import 'package:get/get.dart';
import 'package:prueba_mvc/views/products/components/table_card.dart';
import 'package:prueba_mvc/views/products/layouts/members_add.dart';

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
    ProductsController viewController = ProductsController();
    final viewModel = Provider.of<ProductsModel>(context);
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
                  Members temp=Members(id: "",nombres: "",apellidos: "");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormMaterial(miembro: temp,tipo: "add")),
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
            (viewModel.status == ProductsModelStatus.Loading)
            ? LinearProgressIndicator()
            : Container(),/**/
          (viewModel.status == ProductsModelStatus.Error)
              ? Text(
                  viewModel.errorMessage,
                  //onPressed: () {
                  //  viewController.getter(context);
                  //},
                )
              : Container(),
              (viewModel.integrantes.length==0)
              ? Container()
              :
            tableCard(
              tam,
              viewModel.integrantes,
              viewController
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
  Widget tableCard(final width, List<Members> data, ProductsController viewController) {
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
            0: FixedColumnWidth((width / 5)),
            1: FixedColumnWidth((width / 5)),
            2: FixedColumnWidth((width / 5)),
            3: FixedColumnWidth((width / 5)),
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
                  "names".tr,
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
                  "last_name".tr,
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
              0: FixedColumnWidth((width / 5)),
              1: FixedColumnWidth((width / 5)),
              2: FixedColumnWidth((width / 5)),
              3: FixedColumnWidth((width / 5)),
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
                        data[i].nombres.toString(),
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
                        data[i].apellidos.toString(),
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
                                MaterialPageRoute(builder: (context) => FormMaterial(miembro: data[i],tipo: "edit")),
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