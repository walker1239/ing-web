import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_mvc/languages/languages.dart';
import 'package:prueba_mvc/views/dashboard/dashboard_view.dart';
import 'package:prueba_mvc/views/home/home_view.dart';
import 'package:prueba_mvc/views/sidebar/sidebar_view.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      title: 'Flutter Demo',
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: Locale('es'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(name: '/dashboard', page: () => SidebarView()),
        GetPage(
          name: '/home',
          transition: Transition.cupertino,
          page: () => HomeView(),
        ),
      ]
      //home: SidebarView(),
      //home: HomeView(),
    );
  }
}
