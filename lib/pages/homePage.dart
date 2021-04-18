import 'package:chemical/presentation/screens/search.dart';
import 'package:chemical/3dview/3dView.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedindex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text("Home"),
    search(),
    Text("peroid")
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedindex)),
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.grey,
        elevation: 0.0,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_rounded),
            label: "Periodic Table",
          ),
        ],
        currentIndex: _selectedindex,
        onTap: _onItemSelected,
      ),
    );
  }
}
