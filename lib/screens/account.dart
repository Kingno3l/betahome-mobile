import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/screens/earnings.dart';
import 'package:beta_home/screens/my_store.dart';
import 'package:beta_home/screens/order_history.dart';
import 'package:beta_home/screens/profile.dart';
import 'package:beta_home/screens/reset_password.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/screens/transactions.dart';
import 'package:beta_home/screens/wallet.dart';
import 'package:beta_home/widgets/dp.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer<DataModel>(builder: (contex, data, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Account',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        displayPicture(),
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
                        TextButton.icon(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => data.profile == null
                                  ? const SignIn()
                                  : const Wallet(),
                            ),
                          ),
                          icon: const Icon(
                            Icons.account_balance_wallet,
                            color: Colors.black,
                            size: 20,
                          ),
                          label: const Text(
                            'Wallet',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                              backgroundColor: const Color(0xffFFDA58)),
                        ),
                        // Column(
                        //   children: [
                        //     const Text(
                        //       'Last Login:',
                        //       style: TextStyle(color: Color(0xffAEAEAE)),
                        //     ),
                        //     const SizedBox(
                        //       height: 8,
                        //     ),
                        //     Text(
                        //       data.profile != null
                        //           ? Utils.timeAgo(
                        //               DateTime.parse(data.profile!.last_login))
                        //           : '',
                        //       style: const TextStyle(color: Color(0xff5C5C5C)),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          '${data.profile != null ? data.profile!.first_name : 'Guest'} ',
                          style: const TextStyle(
                              fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          ' ${data.profile != null ? data.profile!.last_name : 'User'}',
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
                          builder: (context) => data.profile == null
                              ? const SignIn()
                              : const Profile(),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffFFDA58),
                            ),
                            child: SvgPicture.asset(
                                './lib/assets/icons/svgs/person.svg'),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffFFDA58),
                            ),
                            child: SvgPicture.asset(
                                './lib/assets/icons/svgs/note.svg'),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffFFDA58),
                            ),
                            child: SvgPicture.asset(
                                './lib/assets/icons/svgs/list.svg'),
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
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 16),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffFFDA58),
                            ),
                            child: SvgPicture.asset(
                                './lib/assets/icons/svgs/help.svg'),
                          ),
                          const Text(
                            'Help',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (data.profile != null &&
                  data.profile!.referral_code != '') ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'SALES WORKFORCE',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => data.profile == null
                                ? const SignIn()
                                : const Earnings(),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xffFFDA58),
                              ),
                              child: SvgPicture.asset(
                                  './lib/assets/icons/svgs/earnings.svg'),
                            ),
                            const Text(
                              'Earnings',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (data.profile != null && data.profile!.is_beta_help) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'BETAHELP',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => data.profile == null
                                ? const SignIn()
                                : const MyStore(),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color(0xffFFDA58),
                              ),
                              child: SvgPicture.asset(
                                  './lib/assets/icons/svgs/market.svg'),
                            ),
                            const Text(
                              'My Store',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'SECURITY',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
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
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: data.profile != null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextButton(
                    onPressed: () => ServerHelper.logout(context),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffF4F4F4),
                      padding: const EdgeInsets.all(15.0),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xffFF0000),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
