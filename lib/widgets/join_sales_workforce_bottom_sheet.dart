import 'dart:async';

import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/select_bank_bottom_sheet.dart';
import 'package:beta_home/widgets/terms_and_conditon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_import
import '../helper/keys.dart';

bool _isTandC = false;

class JoinSalesWorkforceBottomSheet extends StatefulWidget {
  const JoinSalesWorkforceBottomSheet({
    super.key,
  });

  @override
  State<JoinSalesWorkforceBottomSheet> createState() =>
      _JoinSalesWorkforceBottomSheetState();
}

class _JoinSalesWorkforceBottomSheetState
    extends State<JoinSalesWorkforceBottomSheet> {
  // ignore: avoid_init_to_null
  var bankName = null;

  // ignore: prefer_final_fields, unused_field
  var _accountNo = '', _bankCode = '';

  // ignore: avoid_init_to_null
  bool? isLoading = null;

  // ignore: avoid_init_to_null
  bool? verificationStatus = null;

  // ignore: unused_field
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Map<String, dynamic> data = {};

  Future _onVerified(String _accountNo, _bankCode) async {
    try {
      final resp = await ServerHelper.post(UrlHelper.bankResolve, {
        'account_no': _accountNo,
        'bank_code': _bankCode,
      });
      print('STATUS================${resp['status']}');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Utils.showToast(json.msg);
        // _pref.then(
        //   (SharedPreferences pref) {
        // pref.setString(Keys.TOKEN, json.data.toString());
        if (json.status == 'success') {
          setState(() {
            isLoading = true;
            verificationStatus = true;
            isLoading = false;
            // _items = json.data;
            data = json.data;
          });
        }
        // },
        // );
      } else {
        setState(() {
          isLoading = true;
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
  void dispose() {
    // TODO: implement dispose
      bool _isTandC = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _phoneNo = '';
    String _bvnNIN = '';
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          //heading
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: const Column(
              children: [
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
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //body
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        //Container to open select bank bottom sheet
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (context) => SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.55,
                                  child: const SelectBankBottomSheet()),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                bankName == null
                                    ? const Text("Select Bank")
                                    : bankName == ""
                                        ? const Text("Select Bank")
                                        : Text(bankName[0]),
                                SvgPicture.asset("lib/assets/svgs/polygon.svg")
                              ],
                            ),
                          ),
                        ),
                        //account number field
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            controller: TextEditingController(text: _accountNo),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            cursorColor: Colors.black,
                            onChanged: (val) {
                              _accountNo = val;
                              _accountNo.length == 10
                                  ? setState(() {
                                      FocusScope.of(context).unfocus();
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
                        isLoading == true
                            ? CircularProgressIndicator()
                            : Container(),
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
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Error: ",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 17),
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
                        //phone number field
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
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
                        //bvn/nin field
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
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
                        //terms and conditions
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
                                      _isTandC = false;
                                    });
                                  }),
                            ),
                            GestureDetector(
                              onTap: () async {
                                bool result = await showDialog(
                                    context: context,
                                    builder: (context) => TandC());
                                setState(() {
                                  _isTandC = result;
                                });
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
                        //next button
                        GestureDetector(
                          onTap: () {},
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


              // //body
              // SingleChildScrollView(
              //   physics: BouncingScrollPhysics(),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              //     child: Column(
              //       children: [
              //         //Container to open select bank bottom sheet
              //         GestureDetector(
              //           onTap: () {
              //             showModalBottomSheet(
              //               elevation: 0,
              //               backgroundColor: Colors.transparent,
              //               isScrollControlled: true,
              //               isDismissible: true,
              //               context: context,
              //               builder: (context) => const SelectBankBottomSheet(),
              //             ).then((value) {
              //               setState(() {
              //                 bankName = value;
              //               });
              //             });
              //           },
              //           child: Container(
              //             margin: const EdgeInsets.symmetric(vertical: 10),
              //             padding: const EdgeInsets.all(28),
              //             decoration: BoxDecoration(
              //                 color: const Color(0xFFD3FADB),
              //                 borderRadius: BorderRadius.circular(10)),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 bankName == null
              //                     ? const Text("Select Bank")
              //                     : bankName == ""
              //                         ? const Text("Select Bank")
              //                         : Text(bankName[0]),
              //                 SvgPicture.asset("lib/assets/svgs/polygon.svg")
              //               ],
              //             ),
              //           ),
              //         ),
              //         //account number field
              //         Container(
              //           margin: const EdgeInsets.symmetric(vertical: 10),
              //           child: TextField(
              //             controller: accountcontroller,
              //             keyboardType: TextInputType.number,
              //             maxLength: 10,
              //             cursorColor: Colors.black,
              //             onChanged: (val) {
              //               _accountNo = val;
              //               _accountNo.length == 10
              //                   ? setState(() {
              //                       isLoading = true;
              //                       _onVerified(
              //                           accountcontroller.value, bankName[1]);
              //                     })
              //                   : null;
              //             },
              //             decoration: const InputDecoration(
              //               counterText: "",
              //               hintText: 'Bank Account Number',
              //               contentPadding: EdgeInsets.all(28),
              //               border: OutlineInputBorder(
              //                 borderSide: BorderSide.none,
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10)),
              //               ),
              //               filled: true,
              //               fillColor: Color(0xFFD3FADB),
              //             ),
              //             style: const TextStyle(
              //               fontSize: 15,
              //               color: Colors.black,
              //             ),
              //           ),
              //         ),
              //         isLoading == true
              //             ? CircularProgressIndicator()
              //             : Container(),
              //         verificationStatus == true
              //             ? Container(
              //                 margin: const EdgeInsets.symmetric(vertical: 10),
              //                 child: Row(
              //                   children: [
              //                     Icon(Icons.person_2_rounded),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                           horizontal: 10),
              //                       child: Text(data['account_name'].toString(),
              //                           style: TextStyle(fontSize: 17)),
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             : verificationStatus == false
              //                 ? Container(
              //                     margin:
              //                         const EdgeInsets.symmetric(vertical: 10),
              //                     child: Row(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: const [
              //                         Text(
              //                           "Error: ",
              //                           style: TextStyle(
              //                               color: Colors.red, fontSize: 17),
              //                         ),
              //                         Expanded(
              //                             child: Text(
              //                                 "No account found. Please check account number and try again",
              //                                 style: TextStyle(
              //                                     color: Colors.red,
              //                                     fontSize: 15))),
              //                       ],
              //                     ),
              //                   )
              //                 : Container(),
              //         //phone number field
              //         Container(
              //           margin: const EdgeInsets.symmetric(vertical: 10),
              //           child: TextField(
              //             keyboardType: TextInputType.number,
              //             cursorColor: Colors.black,
              //             onChanged: (val) => _phoneNo = val,
              //             decoration: const InputDecoration(
              //               hintText: 'Phone Number',
              //               contentPadding: EdgeInsets.all(28),
              //               border: OutlineInputBorder(
              //                 borderSide: BorderSide.none,
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10)),
              //               ),
              //               filled: true,
              //               fillColor: Color(0xFFD3FADB),
              //             ),
              //             style: const TextStyle(
              //               fontSize: 15,
              //               color: Colors.black,
              //             ),
              //           ),
              //         ),
              //         //bvn/nin field
              //         Container(
              //           margin: EdgeInsets.symmetric(vertical: 10),
              //           child: TextField(
              //             keyboardType: TextInputType.number,
              //             cursorColor: Colors.black,
              //             onChanged: (val) => _bvnNIN = val,
              //             decoration: const InputDecoration(
              //               hintText: 'BVN/NIN',
              //               contentPadding: EdgeInsets.all(28),
              //               border: OutlineInputBorder(
              //                 borderSide: BorderSide.none,
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10)),
              //               ),
              //               filled: true,
              //               fillColor: Color(0xFFD3FADB),
              //             ),
              //             style: const TextStyle(
              //               fontSize: 15,
              //               color: Colors.black,
              //             ),
              //           ),
              //         ),
              //         //terms and conditions
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Transform.scale(
              //               scale: 0.7,
              //               child: Checkbox(
              //                   value: _isTandC,
              //                   activeColor: const Color(0xff273357),
              //                   onChanged: (bool? val) {
              //                     setState(() {
              //                       _isTandC = val!;
              //                     });
              //                   }),
              //             ),
              //             GestureDetector(
              //               onTap: () async {
              //                 await showDialog(
              //                     context: context,
              //                     builder: (context) => TandC());
              //                 setState(() {});
              //               },
              //               child: const Text(
              //                 'Terms & Conditions',
              //                 style: TextStyle(
              //                   fontSize: 12,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         //next button
              //         GestureDetector(
              //           onTap: () {},
              //           child: Container(
              //             margin: const EdgeInsets.symmetric(vertical: 10),
              //             padding: const EdgeInsets.all(28),
              //             decoration: BoxDecoration(
              //                 color: Color(_isTandC ? 0xFFFFDA58 : 0xffC4C4C4),
              //                 borderRadius: BorderRadius.circular(10)),
              //             child: const Center(child: Text("Next")),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),