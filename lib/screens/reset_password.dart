import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:beta_home/widgets/screen_head.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _showOld = false, _showNew = false;
  String _pwd = '', _newPwd = '', _newPwdAgain = '';

  Future _onProceed() async {
    if (_pwd == '' || _newPwd == '' || _newPwdAgain == '') {
      Utils.showToast('All fields are required');
    } else if (_newPwd != _newPwdAgain) {
      Utils.showToast('Password must match');
    } else {
      try {
        final resp = await ServerHelper.post('${UrlHelper.password}/change', {
          'password': _pwd,
          'new_password': _newPwd,
        });
        if (resp['status'] == 200) {
          final HttpResp json = HttpResp.fromJson(resp['data']);
          if (json.status == 'success') {
            if (!mounted) return;
            final isDone = await ServerHelper.logout(context);
            if (isDone) {
              Utils.showToast('Please login');
              if (!mounted) return;
              Navigator.of(context).pop();
            }
          } else {
            Fluttertoast.showToast(
                msg: json.msg, toastLength: Toast.LENGTH_LONG);
          }
        } else {
          Utils.showToast('Connection error.');
        }
      } catch (e) {
        Utils.showToast('An error occured.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Password'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            screenHead('Create New Password',
                'Your new password must be different from the previous password'),
            const SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Colors.black,
              obscureText: !_showOld,
              onChanged: (val) => _pwd = val,
              decoration: InputDecoration(
                hintText: 'Old Password',
                hintStyle: const TextStyle(fontSize: 15),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                fillColor: const Color(0xffFFF6D6),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _showOld = !_showOld;
                  }),
                  icon: Icon(
                    _showOld
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              cursorColor: Colors.black,
              obscureText: !_showNew,
              onChanged: (val) => _newPwd = val,
              decoration: InputDecoration(
                hintText: 'New Password',
                hintStyle: const TextStyle(fontSize: 15),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                fillColor: const Color(0xffFFF6D6),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _showNew = !_showNew;
                  }),
                  icon: Icon(
                    _showNew
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              cursorColor: Colors.black,
              obscureText: !_showNew,
              onChanged: (val) => _newPwdAgain = val,
              decoration: const InputDecoration(
                hintText: 'Re-type New Password',
                hintStyle: TextStyle(fontSize: 15),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                fillColor: Color(0xffFFF6D6),
              ),
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: _onProceed,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffFFDA58),
                padding: const EdgeInsets.all(15),
              ),
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
