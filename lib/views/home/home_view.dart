import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_mvc/widgets/explore_drawer.dart';
import 'package:prueba_mvc/widgets/responsive.dart';
import 'package:prueba_mvc/widgets/top_bar_contents.dart';
// import model
//import 'package:prueba_mvc/models/home/home_model.dart';
// import controller
//import 'package:prueba_mvc/controllers/home/home_controller.dart';

class HomeView extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
        ? AppBar(
            backgroundColor: Colors.black45,
                //Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Tuna Mayor de Arequipa',
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          )
        : PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: TopBarContents(_opacity),
          ),
      drawer: ExploreDrawer(),
      body: Container(
        child: Text('dashboard'),
      ),
    );
       

  }
}