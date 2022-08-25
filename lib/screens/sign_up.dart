import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/mobile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String _fName = '', _lName = '', _email = '', _pwd = '', _cPwd = '';
  bool _isTandC = false, _showError = false;

  void _onProceed() {
    bool isError = false;
    String msg = '';
    if (_fName == '' || _lName == '' || _email == '' || _pwd == '') {
      isError = true;
      msg = 'All fields are required';
    } else if (_pwd != _cPwd) {
      isError = true;
      msg = 'Password must match';
    }

    if (isError) {
      Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
      setState(() {
        _showError = isError;
      });
    } else {
      if (_isTandC) {
        reg();
      } else {
        Fluttertoast.showToast(
            msg: 'Terms & Conditions', toastLength: Toast.LENGTH_LONG);
      }
    }
  }

  Future reg() async {
    try {
      final resp = await ServerHelper.post(UrlHelper.register, {
        'first_name': _fName,
        'last_name': _lName,
        'email': _email,
        'password': _pwd
      });
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Fluttertoast.showToast(msg: json.msg(), toastLength: Toast.LENGTH_LONG);
        if (json.status() == 'success') {
          _pref.then((SharedPreferences pref) {
            pref.setString(Keys.TOKEN, json.token());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Mobile()));
          });
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            direction: Axis.vertical,
            children: [
              screenHead('Sign Up',
                  'Looks like you don’t have an account. Let’s create an account for you.'),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.black,
                  onChanged: (val) => _fName = val,
                  decoration: const InputDecoration(
                    hintText: 'First name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    filled: true,
                    fillColor: Color(0xffFFF6D6),
                    // errorText: _showError ? 'Required' : null,
                    // errorStyle: const TextStyle(
                    //     fontStyle: FontStyle.italic, fontSize: 10, height: 0.5),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.black,
                  onChanged: (val) => _lName = val,
                  decoration: const InputDecoration(
                      hintText: 'Last name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      filled: true,
                      fillColor: Color(0xffFFF6D6)),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) => _email = val,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    filled: true,
                    fillColor: Color(0xffFFF6D6),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    cursorColor: Colors.black,
                    onChanged: (val) => _pwd = val,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        filled: true,
                        fillColor: Color(0xffFFF6D6)),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    cursorColor: Colors.black,
                    onChanged: (val) => _cPwd = val,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Confirm password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        filled: true,
                        fillColor: Color(0xffFFF6D6)),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Checkbox(
                        value: _isTandC,
                        activeColor: const Color(0xff73D282),
                        onChanged: (bool? val) {
                          setState(() {
                            _isTandC = val!;
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
                height: 15,
              ),
              TextButton(
                onPressed: _onProceed,
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    backgroundColor: Color(_isTandC ? 0xFFFFDA58 : 0xffC4C4C4)),
                child: Text('Proceed',
                    style: TextStyle(
                        color: Color(_isTandC ? 0xFF000000 : 0xffffffff))),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Mobile())),
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  // backgroundColor: Color(_isTandC ? 0xFFFFDA58 : 0xffC4C4C4),
                ),
                child: const Text(
                  'I have completed this stage',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.facebook, size: 30),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.facebook,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
