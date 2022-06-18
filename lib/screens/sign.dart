import 'package:flutter/material.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/screens/sign_up.dart';

class Sign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            // child:
            Row(
              children: const [
                Image(
                  image: AssetImage('./lib/assets/imgs/shape-1.png'),
                  height: 60,
                  // width: 220,
                  fit: BoxFit.contain,
                )
              ],
            ),
            Flexible(
                // flex: 1,
                child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 70.0, top: 20),
                    child: const Image(
                      image: AssetImage('./lib/assets/imgs/shape-4.png'),
                      height: 26,
                      // width: 220,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 200),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 50.0),
                    child: const Image(
                      image: AssetImage('./lib/assets/imgs/shape-5.png'),
                      height: 26,
                      // width: 220,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              )
            ])),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Image(
                  image: AssetImage('./lib/assets/imgs/shape-2.png'),
                  height: 35,
                  // width: 220,
                  fit: BoxFit.contain,
                ),
                Image(
                  image: AssetImage('./lib/assets/imgs/shape-3.png'),
                  height: 60,
                  // width: 220,
                  fit: BoxFit.contain,
                )
              ],
            )
            // ),
          ],
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('./lib/assets/imgs/circular.png'),
                // height: 8,
                width: 240,
                // fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  height: 45,
                  width: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFFDA58)),
                      child: const Text('Sign In',
                          style: TextStyle(color: Color(0xFF000000))))),
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: 45,
                  width: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF273357)),
                      child: const Text('Sign Up',
                          style: TextStyle(color: Color(0xFFFFFFFF))))),
            ],
          ),
        )
      ]),
    );
  }
}
