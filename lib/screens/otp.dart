import 'package:beta_home/screens/verified.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';

class OTP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
          direction: Axis.vertical,
          children: [
            screenHead('OTP', 'Enter the OTP sent to the registered number'),
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffFFF6D6)),
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff000000),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Verified()));
              },
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  backgroundColor: const Color(0xFFFFDA58)),
              child: const Text('Proceed',
                  style: TextStyle(color: Color(0xFF000000))),
            ),
          ],
        ),
      ),
    );
  }
}
