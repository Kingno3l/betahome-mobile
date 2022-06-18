import 'package:beta_home/screens/account.dart';
import 'package:beta_home/screens/market.dart';
import 'package:beta_home/screens/services.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/screens/home.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentTabIndex = 0;

  static final List<Widget> _contentOptions = <Widget>[
    Home(),
    Market(),
    Services(),
    Account()
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentOptions[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Market'),
          BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services), label: 'Services'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: 'Account'),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentTabIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xffAEAEAE),
        iconSize: 26,
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        selectedLabelStyle: const TextStyle(fontSize: 11),
        onTap: _onTabSelected,
        elevation: 0,
      ),
    );
  }
}
