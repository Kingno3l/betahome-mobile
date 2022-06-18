import 'package:beta_home/screens/mobile.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:beta_home/screens/sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isTandC = false;

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
        actions: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Color(0xff73D282)),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          direction: Axis.vertical,
          children: [
            screenHead('Sign Up',
                'Looks like you don’t have an account. Let’s create an account for you.'),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Full name',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffFFF6D6)),
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff000000),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
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
            const Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffFFF6D6)),
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff000000),
                  ),
                )),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Confirm password',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffFFF6D6)),
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff000000),
                  ),
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: Checkbox(
                      value: isTandC,
                      activeColor: const Color(0xff73D282),
                      onChanged: (bool? val) {
                        setState(() {
                          isTandC = val!;
                        });
                      }),
                ),
                const Text(
                  'Terms & Conditions',
                  style: TextStyle(fontSize: 12, color: Color(0xff73D282)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: isTandC
                  ? () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mobile()));
                    }
                  : null,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  backgroundColor: Color(isTandC ? 0xFFFFDA58 : 0xffC4C4C4)),
              child: Text('Proceed',
                  style: TextStyle(
                      color: Color(isTandC ? 0xFF000000 : 0xffffffff))),
            ),
            const SizedBox(height: 30),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 0.6,
                    color: const Color(0xffFFDA58),
                  )),
              const Text(
                'Other options',
                style: TextStyle(fontSize: 11),
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 0.6,
                    color: const Color(0xffFFDA58),
                  ))
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                IconButton(
                    onPressed: null, icon: Icon(Icons.facebook, size: 30)),
                SizedBox(width: 10),
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.facebook,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
