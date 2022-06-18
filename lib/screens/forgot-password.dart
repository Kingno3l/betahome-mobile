import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:beta_home/screens/sign_up.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
            screenHead('Forgot Password', 'Enter your registered email'),
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Email',
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
              onPressed: null,
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
