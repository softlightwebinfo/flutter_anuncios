import 'package:flutter/material.dart';
import 'package:flutter_anuncios/settings.dart';
import 'package:flutter_anuncios/ui/buildAppBar.dart';
import 'package:flutter_anuncios/ui/buildMainPageWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildAppBar(
                context: context,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: BuildMainPageWidget(
              tabController: _tabController,
              index: currentIndex,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xfffafafa),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorTheme,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Anuncios"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text("Tienda"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text("Localizacion"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favoritos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text("Cuenta"),
          )
        ],
      ),
    );
  }
}
