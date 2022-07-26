import 'package:beta_home/screens/wallet.dart';
import 'package:beta_home/widgets/DP.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:flutter_svg/svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Password'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create New Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Your new password must be different  from the previous password',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 30,
            ),
            const TextField(
              cursorColor: Colors.black,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Old Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                fillColor: Color(0xffFFF6D6),
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              cursorColor: Colors.black,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'New Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                fillColor: Color(0xffFFF6D6),
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              cursorColor: Colors.black,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Re-type New Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                fillColor: Color(0xffFFF6D6),
                // suffixIcon: Icon(
                //   Icons.visibility_off_outlined,
                //   size: 20,
                //   color: Colors.black,
                // ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffFFDA58),
                padding: const EdgeInsets.all(26),
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
