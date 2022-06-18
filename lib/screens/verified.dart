import 'package:beta_home/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';

class Verified extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.vertical,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff73D282),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 46,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'OTP Successful',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff73D282), fontSize: 12),
            ),
            const SizedBox(
              height: 60,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  backgroundColor: const Color(0xFFFFDA58)),
              child:
                  const Text('Ok', style: TextStyle(color: Color(0xFF000000))),
            ),
          ],
        ),
      ),
    );
  }
}
