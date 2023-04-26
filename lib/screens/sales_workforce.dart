import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/earnings.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import '../widgets/join_sales_workforce_bottom_sheet.dart';

class SalesWorkforce extends StatefulWidget {
  const SalesWorkforce({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SalesWorkforceState();
}

class _SalesWorkforceState extends State<SalesWorkforce> {
  Future _getCode() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.setReferralCode);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Fluttertoast.showToast(msg: json.msg, toastLength: Toast.LENGTH_LONG);
        if (json.status == 'success') {
          // setState(() {
          //   _items = json.data;
          // });
          if (!mounted) return;
          ServerHelper.getProfile(context);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'An error occured', toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Scaffold(
        body: Center(
          child: data.profile != null && data.profile!.referral_code != ''
              ? Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        'Hello ${data.profile!.first_name}, start earning today with your referral code. Simply invite someone to sign up or buy one of our Beta products.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                          border: Border.all(
                              color: const Color(0xffFFDA58), width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.profile!.referral_code,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffFFDA58),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                await Clipboard.setData(ClipboardData(
                                    text: data.profile!.referral_code));
                                Fluttertoast.showToast(
                                    msg: 'Copied',
                                    toastLength: Toast.LENGTH_SHORT);
                              },
                              icon: const Icon(
                                Icons.copy_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Earnings()),
                      ),
                      icon: SvgPicture.asset(
                        './lib/assets/icons/svgs/earnings.svg',
                        width: 20,
                        height: 20,
                      ),
                      label: const Text(
                        'My Earnings',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          backgroundColor: const Color(0xffFFDA58)),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      width: 220,
                      child: Text(
                        'Join our Sales Workforce team and make money with your referral code.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (data.profile != null &&
                        data.profile!.referral_code == '') ...[
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            enableDrag: true,
                            context: context,
                            builder: (context) {
                              return Wrap(
                                  children: [const JoinSalesWorkforceBottomSheet()]);
                            });
                        },//=> _getCode()
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 14,
                          ),
                          backgroundColor: const Color(0xFFFFDA58),
                        ),
                        child: const Text(
                          'Get referral code',
                          style: TextStyle(
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ] else ...[
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 14,
                          ),
                          backgroundColor: const Color(0xFFFFDA58),
                        ),
                        child: const Text(
                          'Join now',
                          style: TextStyle(
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Already a member?'),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xFFFFDA58),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
        ),
      );
    });
  }
}
