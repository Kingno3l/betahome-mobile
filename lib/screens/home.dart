import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/profile.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/widgets/beta_office.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:beta_home/widgets/beta_home.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tabIndex = 0;
  List _items = [];

  Future getPackages() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.packages);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _items = json.data;
          });
        } else {
          Fluttertoast.showToast(msg: json.msg, toastLength: Toast.LENGTH_LONG);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'An error occured.', toastLength: Toast.LENGTH_LONG);
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
                        child: Row(
                          children: [
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
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            data.profile == null
                                                ? const SignIn()
                                                : const Profile(),
                                      ),
                                    )
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Welcome${data.profile != null ? ', ${data.profile?.first_name}' : ''}',
                              style: const TextStyle(
                                color: Color(0xff000000),
                              ),
                            )
                          ],
                        ),
                      ),
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
                    ? BetaHome(items: _items)
                    : BetaOffice(items: _items))
          ],
        ),
      );
    });
  }
}
