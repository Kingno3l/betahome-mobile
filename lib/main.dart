import 'package:beta_home/models/data.dart';
import 'package:beta_home/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beta Home',
      theme: ThemeData(
        // primarySwatch: Colors.green,
        // fontFamily: 'Verdana',
        backgroundColor: Colors.white,
        // colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}
