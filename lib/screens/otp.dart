import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/verified.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String _otp = '';
  bool _isProgress = false;

  Future _onFinish() async {
    if (_otp == '') {
      Utils.showToast('Please enter OTP');
    } else {
      try {
        setState(() {
          _isProgress = true;
        });
        final resp = await ServerHelper.post('${UrlHelper.register}/verify', {
          'verification_code': _otp,
        });
        if (resp['status'] == 401) {
          Utils.showToast('Please login or create account');
        } else if (resp['status'] == 200) {
          final HttpResp json = HttpResp.fromJson(resp['data']);
          Utils.showToast(json.msg);
          if (json.status == 'success') {
            _pref.then((SharedPreferences pref) {
              pref.setString(Keys.TOKEN, json.token);
              ServerHelper.getProfile(context,
                  route: MaterialPageRoute(
                      builder: (context) => const Verified()));
            });
          }
        } else {
          Utils.showToast('Connection error.');
        }
      } catch (e) {
        Utils.showToast('An error occured');
      }
      setState(() {
        _isProgress = false;
      });
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
            screenHead('OTP',
                'Enter the OTP sent to your email address or phone number.'),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                onChanged: (val) => _otp = val,
                decoration: const InputDecoration(
                    hintText: 'Enter OTP',
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
              onPressed: _isProgress ? null : _onFinish,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: const Color(0xFFFFDA58)),
              child: Text(_isProgress ? 'Processing...' : 'Proceed',
                  style: const TextStyle(color: Color(0xFF000000))),
            ),
          ],
        ),
      ),
    );
  }
}
