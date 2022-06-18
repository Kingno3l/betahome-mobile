import 'package:beta_home/screens/dashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:beta_home/screens/sign_up.dart';
import 'package:beta_home/screens/forgot-password.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showPwd = false;

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
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: const Text(
                  'Sign Up',
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
            screenHead('Sign In', 'Welcome to Beta Homes, sign in and enjoy.'),
            const Padding(
              padding: EdgeInsets.only(top: 50),
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
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffFFF6D6),
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        size: 14,
                        color: Colors.black,
                      )),
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff000000),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Forgotten your password?',
                      style: const TextStyle(
                          color: Color(0xff000000), fontSize: 12),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()))
                            })),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  backgroundColor: const Color(0xFFFFDA58)),
              child: const Text('Proceed',
                  style: TextStyle(color: Color(0xFF000000))),
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
