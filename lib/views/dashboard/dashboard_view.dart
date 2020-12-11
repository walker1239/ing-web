import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/views/sidebar/sidebar_view.dart';
// import model
//import 'package:prueba_mvc/models/dashboard/dashboard_model.dart';
// import controller
//import 'package:prueba_mvc/controllers/dashboard/dashboard_controller.dart';
class DashboardView extends StatefulWidget {
  const DashboardView();

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String a ="dashboard";
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Text( a ),
    //TODO Add layout or component here
    );
  }
}

/*class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DashboardController viewController = DashboardController();
    return ChangeNotifierProvider<DashboardModel>(
      create: (context) => DashboardModel.instance(),
      child: Consumer<DashboardModel>(
        builder: (context, viewModel, child) {
          return Container(
              //TODO Add layout or component here
              );
        },
      ),
    );
  }
}*/ 