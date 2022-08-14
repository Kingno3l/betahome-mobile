import 'package:beta_home/helper/keys.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/screens/profile.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/widgets/beta_office.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:beta_home/widgets/beta_home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  int _tabIndex = 0;
  List _data = [];

  Future getPackages() async {
    try {
      final resp = await Dio().get(UrlHelper.packages);

      if (resp.statusCode == 200) {
        HttpResp json = HttpResp.fromJson(resp.data);

        if (json.status() == "success") {
          // AlertDialog(content: Text(json.msg()));
          print('Sucess: ${json.msg()}');
          // print('Data: ${json.data()}');
          setState(() {
            _data = json.data();
          });
        } else {
          // AlertDialog(content: Text(json.msg()));
          print('Error: ${json.msg()}');
        }
      }
    } catch (e) {
      // AlertDialog(content: Text(e.toString()));
    }
  }

  @override
  void initState() {
    super.initState();
    getPackages();
  }

  void _onTabSelected(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: const BoxDecoration(
                  color: Color(0xffFFF6D6),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: const NetworkImage(
                              'https://img.icons8.com/ios-glyphs/60/95A5A6/test-account.png'),
                          radius: 20,
                          child: Material(
                            shape: const CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: () =>
                                    // {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            data.profile == null
                                                ? const SignIn()
                                                : const Profile(),
                                      ),
                                    )

                                // data.profile == null
                                //     ? Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) => const SignIn(),
                                //         ),
                                //       )
                                //     : Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) => const Profile(),
                                //         ),
                                //       )

                                // _pref.then((SharedPreferences pref) {
                                //   !(pref.getBool(Keys.IS_LOGGED_IN) ?? false)
                                //       ? Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //             builder: (context) => SignIn(),
                                //           ),
                                //         )
                                //       : Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const Profile(),
                                //           ),
                                //         );
                                // })
                                // },
                                ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Welcome, ${data.profile?.first_name}',
                          style: const TextStyle(color: Color(0xff000000)),
                        )
                      ])),
                      Stack(
                        children: [
                          const Icon(
                            Icons.notifications,
                            color: Color(0xff000000),
                          ),
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(left: 15, top: 2),
                            decoration: const BoxDecoration(
                                color: Color(0xffFF0000),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    cursorColor: Colors.black,
                    maxLines: 1,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search what you need',
                        hintStyle: const TextStyle(color: Color(0xffAEAEAE)),
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: const Color(0xffffffff),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Color(0xffAEAEAE),
                        )),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 38,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffD9D9D9), width: 1.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () => _onTabSelected(0),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          backgroundColor: _tabIndex == 0
                              ? const Color(0xffFFF6D6)
                              : const Color(0xffFAFAFA)),
                      child: const Text(
                        'BetaHome Furniture',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff2F2E41), fontSize: 12),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () => _onTabSelected(1),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            backgroundColor: _tabIndex == 1
                                ? const Color(0xffFFF6D6)
                                : const Color(0xffFAFAFA)),
                        child: const Text(
                          'BetaOffice Furniture',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xff2F2E41), fontSize: 12),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
                child: _tabIndex == 0
                    ? BetaHome(items: _data)
                    : BetaOffice(items: _data))
          ],
        ),
      );
    });
  }
}
