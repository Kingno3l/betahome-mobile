import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';

class Services extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
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
            screenHead(
                'Services', 'Enter the OTP sent to the registered number'),
          ],
        ),
      ),
    );
  }
}
