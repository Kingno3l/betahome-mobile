import 'package:flutter/material.dart';

import 'package:beta_home/screens/get_started.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.green,
        fontFamily: 'Georgia',
        backgroundColor: Colors.white,
      ),
      home: const GetStarted(),
    );
  }
}
