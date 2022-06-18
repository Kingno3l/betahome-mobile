import 'package:beta_home/screens/otp.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';

class Mobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
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
            screenHead('Mobile',
                'An OTP will be sent to the number you register here'),
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OTP()));
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
