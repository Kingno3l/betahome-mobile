import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/dashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:beta_home/screens/sign_up.dart';
import 'package:beta_home/screens/forgot-password.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  bool showPwd = false;
  String _email = '', _pwd = '';

  Future _onProceed() async {
    if (_email == '' || _pwd == '') {
      Fluttertoast.showToast(
          msg: 'All fields are required', toastLength: Toast.LENGTH_LONG);
    } else {
      try {
        final resp = await ServerHelper.post(UrlHelper.login, {
          'email': _email,
          'password': _pwd,
        });
        if (resp['status'] == 200) {
          final HttpResp json = HttpResp.fromJson(resp['data']);
          print(resp['data']);
          Fluttertoast.showToast(
              msg: json.msg(), toastLength: Toast.LENGTH_LONG);
          _pref.then((SharedPreferences pref) {
            pref.setString(Keys.TOKEN, json.token());
            if (json.status() == 'success') {
              ServerHelper.getProfile(context,
                  route: MaterialPageRoute(
                      builder: (context) => const Dashboard()));
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Dashboard()));
            }
          });
        } else {
          Fluttertoast.showToast(
              msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          direction: Axis.vertical,
          children: [
            screenHead('Sign In', 'Welcome to Beta Homes, sign in and enjoy.'),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => _email = val,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffFFF6D6)),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  onChanged: (val) => _pwd = val,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffFFF6D6),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      size: 14,
                      color: Colors.black,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff000000),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Forgotten your password?',
                  style:
                      const TextStyle(color: Color(0xff000000), fontSize: 12),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          ),
                        },
                ),
              ),
            ),
            TextButton(
              onPressed: _onProceed,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
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
