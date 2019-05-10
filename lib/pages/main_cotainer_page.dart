import 'package:flutter/material.dart';
import 'package:us_stock/pages/first_page.dart';
import 'package:us_stock/pages/second_page.dart';
import 'package:us_stock/pages/stock_detail_page.dart';
import 'package:us_stock/pages/test_page.dart';

class MainContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainContainerPageState();
}

class MainContainerPageState extends State<MainContainerPage> {
  var appBarTitle = "Home";
  var _selectedIndex = 0;
  final _bottomBarTitleList = ["Home", "Search", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Builder(builder: (context) => buildColumn(context)),
      drawer: buildDrawer(context),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildColumn(BuildContext context) {
    if (_selectedIndex == 0) {
      return StockDetailPage();
    } else if (_selectedIndex == 1) {
      return SecondPage();
    } else {
      return TestPage();
    }
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
//            child: Image.network(
//              iuImagePath,
//              fit: BoxFit.contain,
//            ),
            decoration: BoxDecoration(color: Colors.red),
          ),
          ListTile(
            title: Text("Home"),
            subtitle: Text("Main page"),
            onTap: () {
              Navigator.pop(context);
              selectBottomNavigationBarItem(0);
            },
          ),
          ListTile(
            title: Text("Search"),
            subtitle: Text("Search via network"),
            onTap: () {
              Navigator.pop(context);
              selectBottomNavigationBarItem(1);
            },
          ),
          ListTile(
            title: Text("Settings"),
            subtitle: Text("Manage your profile"),
            onTap: () {
              Navigator.pop(context);
              selectBottomNavigationBarItem(2);
            },
          )
        ],
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text(_bottomBarTitleList[0])),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text(_bottomBarTitleList[1])),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text(_bottomBarTitleList[2]))
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.deepOrangeAccent,
      onTap: (int index) {
        selectBottomNavigationBarItem(index);
      },
    );
  }

  void selectBottomNavigationBarItem(int index) {
    setState(() {
      _selectedIndex = index;
      appBarTitle = _bottomBarTitleList[index];
    });
  }
}