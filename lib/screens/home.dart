import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/widgets/beta_office.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:beta_home/widgets/beta_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: const BoxDecoration(
                color: Color(0xffFFF6D6),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Row(children: const [
                      CircleAvatar(
                        radius: 24,
                        child: Image(
                          image: NetworkImage('./lib/assets/imgs/dp.png'),
                          height: 60,
                          // width: 220,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Welcome, Jeffrey',
                        style: TextStyle(color: Color(0xff000000)),
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
                        size: 16,
                        color: Color(0xffAEAEAE),
                      )),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xff000000),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffD9D9D9), width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () => _onTabSelected(0),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: _tabIndex == 0
                              ? const Color(0xffFFF6D6)
                              : const Color(0xffFAFAFA)),
                      child: const Text(
                        'BetaHome Furniture',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff2F2E41), fontSize: 12),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () => _onTabSelected(1),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
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
    ;
  }
}
