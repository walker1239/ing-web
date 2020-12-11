import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/languages/languages.dart';
import 'package:prueba_mvc/utils/authentication.dart';
import 'package:prueba_mvc/views/dashboard/dashboard_view.dart';
import 'package:prueba_mvc/views/home/home_view.dart';
import 'package:prueba_mvc/views/products/products_view.dart';
import 'package:prueba_mvc/views/roles/roles_view.dart';
import 'package:get/get.dart';
import 'package:prueba_mvc/views/users/users_view.dart';
// import model
//import 'package:prueba_mvc/models/sidebar/sidebar_model.dart';
// import controller
//import 'package:prueba_mvc/controllers/sidebar/sidebar_controller.dart';

class SidebarView extends StatefulWidget {
  const SidebarView();

  @override
  _SidebarViewState createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {
  Widget mainWidget = DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
              
              Icon(
                Icons.translate,
              ),
              SizedBox(width:10),
               DropdownButton<String>(
                items: <String>['English', 'Spanish'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(
                  fontSize:20
                ),),
                  );
                }).toList(),
                onChanged: (value) {
                  if(value=='Spanish')
                    setState(() {
                      Get.updateLocale(Locale('es'));
                    });
                  else
                    setState(() {
                      Get.updateLocale(Locale('en'));
                    });
                },
                value: ("lang".tr=='es')?'Spanish':'English',
              ),
              SizedBox(width:100)
            ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            
            ListTile(
              title: Text("dashboard".tr),
              onTap: (){
                setState(() {
                  mainWidget=DashboardView();
                });
                Navigator.pop(
                  context
                );
              },
            ),
            actual.rol=='admin'?
            ListTile(
              title: Text("users".tr),
              onTap: (){
                setState(() {
                  mainWidget=UsersView();
                });
                Navigator.pop(
                  context
                );
              },
            ):Container(),
            actual.rol=='admin'?
            ListTile(
              title: Text("roles".tr),
              onTap: (){
                setState(() {
                  mainWidget=RolesView();
                });
                Navigator.pop(
                  context
                );
              },
            ):Container(),
            (actual.rol=='admin' || actual.rol=='members') ?
            ListTile(
              title: Text("members".tr),
              onTap: (){
                setState(() {
                  mainWidget=ProductsView();
                });
                Navigator.pop(
                  context
                );
              },
            ):Container(),
            ListTile(
              title: Text("Logout"),
              onTap: (){
                signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomeView();
                    },
                  ),
                );
                
              },
            )
          ],
        ),
      ),
      body: mainWidget,
    );
      
  }
}
/*class SidebarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SidebarController viewController = SidebarController();
    return ChangeNotifierProvider<SidebarModel>(
      create: (context) => SidebarModel.instance(),
      child: Consumer<SidebarModel>(
        builder: (context, viewModel, child) {
          return Container(
              //TODO Add layout or component here
              );
        },
      ),
    );
  }
}*/