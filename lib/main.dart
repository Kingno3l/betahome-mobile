import 'package:flutter/material.dart';

import 'package:beta_home/screens/get_started.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GetStarted(),
    );
  }
}
