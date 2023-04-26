import 'dart:async';
import 'dart:convert';

import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/select_bank_bottom_sheet.dart';
import 'package:beta_home/widgets/terms_and_conditon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/keys.dart';

bool _isTandC = false;

class JoinSalesWorkforceBottomSheet extends StatefulWidget {
  const JoinSalesWorkforceBottomSheet({
    super.key,
  });

  @override
  State<JoinSalesWorkforceBottomSheet> createState() => _JoinSalesWorkforceBottomSheetState();
}

class _JoinSalesWorkforceBottomSheetState extends State<JoinSalesWorkforceBottomSheet> {
  var bankName = null;
  var _accountNo = '', _bankCode = '';
  bool? isLoading = null;
  bool? verificationStatus = null;
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  List _items = [];
  Map<String, dynamic> data = {};

  Future _onVerified(_accountNo, _bankCode) async {
    try {
      final resp = await ServerHelper.post(UrlHelper.bankResolve, {
        'account_no': _accountNo,
        'bank_code': _bankCode,
      });
      print('STATUS================${resp['status']}');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Utils.showToast(json.msg);
        _pref.then((SharedPreferences pref) {
          pref.setString(Keys.TOKEN, json.data.toString());
          if (json.status == 'success') {
            setState(() {
              verificationStatus = true;
              isLoading = false;
              // _items = json.data;
              data = json.data;
            });
          }
        });
      } else {
        setState(() {
          verificationStatus = false;
          isLoading = false;
        });
      }
    } catch (e) {
      print('EXCEPTION===========$e');
      Utils.showToast('An error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    String _phoneNo = '';
    String _bvnNIN = '';
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),
                      child: Column(
                        children: const [
                          Divider(
                            thickness: 4,
                            indent: 150,
                            endIndent: 150,
                            color: Color(0xFFBBBBBB),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Join sales workforce",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                isDismissible: true,
                                context: context,
                                builder: (context) => const SelectBankBottomSheet(),
                              ).then((value) {
                                setState(() {
                                  bankName = value;
                                });
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFD3FADB),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  bankName == null
                                      ? const Text("Select Bank")
                                      : bankName == ""
                                          ? const Text("Select Bank")
                                          : Text(bankName[0]),
                                  SvgPicture.asset(
                                      "lib/assets/svgs/polygon.svg")
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              maxLength: 10,
                              cursorColor: Colors.black,
                              onChanged: (val) {
                                _accountNo = val;
                                _accountNo.length == 10
                                    ? setState(() {
                                        isLoading = true;
                                        _onVerified(_accountNo, bankName[1]);
                                      })
                                    : null;
                              },
                              decoration: const InputDecoration(
                                counterText: "",
                                hintText: 'Bank Account Number',
                                contentPadding: EdgeInsets.all(28),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                filled: true,
                                fillColor: Color(0xFFD3FADB),
                              ),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          verificationStatus == true
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person_2_rounded),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                            data['account_name'].toString(),
                                            style: TextStyle(fontSize: 17)),
                                      ),
                                    ],
                                  ),
                                )
                              : verificationStatus == false
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Error: ",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17),
                                          ),
                                          Expanded(
                                              child: Text(
                                                  "No account found. Please check account number and try again",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15))),
                                        ],
                                      ),
                                    )
                                  : Container(),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              cursorColor: Colors.black,
                              onChanged: (val) => _phoneNo = val,
                              decoration: const InputDecoration(
                                hintText: 'Phone Number',
                                contentPadding: EdgeInsets.all(28),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                filled: true,
                                fillColor: Color(0xFFD3FADB),
                              ),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              cursorColor: Colors.black,
                              onChanged: (val) => _bvnNIN = val,
                              decoration: const InputDecoration(
                                hintText: 'BVN/NIN',
                                contentPadding: EdgeInsets.all(28),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                filled: true,
                                fillColor: Color(0xFFD3FADB),
                              ),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                    value: _isTandC,
                                    activeColor: const Color(0xff273357),
                                    onChanged: (bool? val) {
                                      setState(() {
                                        _isTandC = val!;
                                      });
                                    }),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (context) => TandC());
                                  setState(() {});
                                },
                                child: const Text(
                                  'Terms & Conditions',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // _isTandC
                              //     ? showDialog(
                              //         context: context, builder: (context) => TandC())
                              //     : null;
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                  color:
                                      Color(_isTandC ? 0xFFFFDA58 : 0xffC4C4C4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(child: Text("Next")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isLoading == true
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
