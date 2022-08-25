import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailCont = TextEditingController(text: '');

  Future _onProceed() async {
    if (_emailCont.text == '') {
      Fluttertoast.showToast(
          msg: 'Please enter your account email address',
          toastLength: Toast.LENGTH_LONG);
    } else {
      try {
        final resp = await ServerHelper.post(
            '${UrlHelper.password}/forgot', {'email': _emailCont.text});
        if (resp['status'] == 200) {
          final HttpResp json = HttpResp.fromJson(resp['data']);
          Fluttertoast.showToast(msg: json.msg, toastLength: Toast.LENGTH_LONG);
          if (json.status == 'success') {
            _emailCont.text = '';
          }
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
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          direction: Axis.vertical,
          children: [
            screenHead('Forgot Password', 'Enter your registered email'),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                controller: _emailCont,
                decoration: const InputDecoration(
                    hintText: 'Email',
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
            TextButton(
              onPressed: _onProceed,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
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
