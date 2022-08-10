import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/screens/dashboard.dart';
import 'package:beta_home/screens/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), () {
      _pref.then((SharedPreferences pref) {
        bool isLoggedIn = pref.getBool(Keys.IS_GET_STARTED) ?? false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? const Dashboard() : const GetStarted(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SvgPicture.asset(
          './lib/assets/svgs/full_logo.svg',
          width: 70,
        ),
      ),
    );
  }
}
