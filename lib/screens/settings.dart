import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/screens/order_history.dart';
import 'package:beta_home/screens/profile.dart';
import 'package:beta_home/screens/reset_password.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/screens/transactions.dart';
import 'package:beta_home/widgets/dp.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  void _onLogout() async {
    SharedPreferences pref = await _pref;
    // bool isDone = await pref.remove(Keys.PROFILE);
    // if (!mounted) return;
    // if (isDone) {
    //   Provider.of<DataModel>(context, listen: false).profile =
    //       pref.getString(Keys.PROFILE);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (contex, data, child) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                dp(),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  width: 1,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xffC8C8C8),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: const [
                    Text(
                      'Last Login:',
                      style: TextStyle(color: Color(0xffAEAEAE)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '3 weeks ago',
                      style: TextStyle(color: Color(0xff5C5C5C)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  '${data.profile!.first_name ?? 'Guest'} ',
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
                Text(
                  data.profile!.last_name ?? 'User',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color(0xFF8E8E8E),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      data.profile == null ? const SignIn() : const Profile(),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xffFFDA58),
                    ),
                    child:
                        SvgPicture.asset('./lib/assets/icons/svgs/person.svg'),
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => data.profile == null
                      ? const SignIn()
                      : const Transactions(),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xffFFDA58),
                    ),
                    child: SvgPicture.asset('./lib/assets/icons/svgs/note.svg'),
                  ),
                  const Text(
                    'Transactions',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => data.profile == null
                      ? const SignIn()
                      : const OrderHistory(),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xffFFDA58),
                    ),
                    child: SvgPicture.asset('./lib/assets/icons/svgs/list.svg'),
                  ),
                  const Text(
                    'Order History',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => data.profile == null
                      ? const SignIn()
                      : const ResetPassword(),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xffFFDA58),
                    ),
                    child: SvgPicture.asset(
                        './lib/assets/icons/svgs/password.svg'),
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xffFFDA58),
                    ),
                    child: SvgPicture.asset('./lib/assets/icons/svgs/help.svg'),
                  ),
                  const Text(
                    'Help',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: _onLogout,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffF4F4F4),
                padding: const EdgeInsets.all(20),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Color(0xffFF0000),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
