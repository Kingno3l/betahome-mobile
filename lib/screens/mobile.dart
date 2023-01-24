import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/otp.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  // final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String _country_code = '234', _phone = '';
  bool _isProgress = false;

  Future _onProceed() async {
    if (_country_code == '' || _phone == '') {
      Utils.showToast('All fields are required');
    } else {
      try {
        setState(() {
          _isProgress = true;
        });
        final resp = await ServerHelper.post('${UrlHelper.register}/complete', {
          'country_code': _country_code,
          'phone': _phone,
        });
        if (resp['status'] == 401) {
          Utils.showToast('Please login or create account');
        } else if (resp['status'] == 200) {
          final HttpResp json = HttpResp.fromJson(resp['data']);
          Utils.showToast(json.msg);
          if (json.status == 'success') {
            (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OTP(),
                ),
              );
            })();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            screenHead('Mobile', 'An OTP will be sent to this number.'),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      cursorColor: Colors.black,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: _country_code,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                        ),
                        filled: true,
                        fillColor: const Color(0xffFFF6D6),
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => _phone = val,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
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
                ],
              ),
            ),
            TextButton(
              onPressed: _isProgress ? null : _onProceed,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: const Color(0xFFFFDA58)),
              child: Text(_isProgress ? 'Processing...' : 'Proceed',
                  style: const TextStyle(color: Color(0xFF000000))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OTP())),
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                // backgroundColor: Color(_isTandC ? 0xFFFFDA58 : 0xffC4C4C4),
              ),
              child: const Text(
                'I have an OTP',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
