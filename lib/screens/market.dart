import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';

class Market extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MarketState();
}

class _MarketState extends State<Market> {
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
            screenHead('Market', 'Enter the OTP sent to the registered number'),
          ],
        ),
      ),
    );
  }
}
