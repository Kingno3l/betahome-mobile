import 'package:beta_home/screens/product.dart';
import 'package:beta_home/screens/account.dart';
import 'package:beta_home/screens/market.dart';
import 'package:beta_home/screens/sales_Workforce_Screen.dart';
import 'package:beta_home/screens/services.dart';
import 'package:beta_home/screens/wallet.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/screens/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentTabIndex = 0;

  static final List<Widget> _contentOptions = <Widget>[
    const Home(),
    Product(),
    // const SalesWorkForceScreen(),
    const Market(),
    const Services(),
    const Account()
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // SafeArea(
        //   top: true,
        //   child:
        Scaffold(
      body: _contentOptions[_currentTabIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list_rounded), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Market'),
          BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services), label: 'Services'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Account'),
        ],
        type: BottomNavigationBarType.fixed,
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
    // );
  }
}
