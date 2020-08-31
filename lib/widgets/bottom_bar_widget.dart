import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class BottomBarWidget extends StatefulWidget {
  int index;
  BottomBarWidget({this.index = 0});

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState(index);
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  int _selectedIndex;

  static const List<String> _bottomBarRoutes = [
    HomeViewRoute,
    SearchViewRoute,
    ProfileViewRoute,
  ];

  _BottomBarWidgetState(int index) {
    this._selectedIndex = index;
  }

  void _onItemTapped(int index) {
    bool change = _selectedIndex != index;
    setState(() {
      _selectedIndex = index;
    });
    if (change) _navigatorService.navigateTo(_bottomBarRoutes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xFF24ABBC),
      onTap: _onItemTapped,
    );
  }
}
