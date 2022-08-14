import 'package:beta_home/models/data.dart';
import 'package:beta_home/screens/wallet.dart';
import 'package:beta_home/widgets/DP.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

import 'package:beta_home/widgets/screen_head.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Scaffold(
        appBar: ScreenBar.build(context, 'Profile'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const SizedBox(
              //   height: 30,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  dp(),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 24,
                        height: 3,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => setState(() {
                      _isEdit = true;
                    }),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: const Color(0xffFFDA58),
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.black,
                readOnly: !_isEdit,
                decoration: InputDecoration(
                  hintText: data.profile!.first_name ?? 'Name',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xffECECEC),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.black,
                readOnly: !_isEdit,
                decoration: InputDecoration(
                  hintText: data.profile!.email ?? 'Email',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xffECECEC),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.black,
                readOnly: !_isEdit,
                decoration: InputDecoration(
                  hintText: data.profile!.phone ?? 'Phone No.',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xffECECEC),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.black,
                readOnly: !_isEdit,
                decoration: InputDecoration(
                  hintText: data.profile!.address ?? 'Address',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xffECECEC),
                ),
                style: const TextStyle(
                  fontSize: 15,
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
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
