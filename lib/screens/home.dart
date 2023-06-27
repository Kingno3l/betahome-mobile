import 'dart:async';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/explore.dart';
import 'package:beta_home/screens/beta_help.dart';
import 'package:beta_home/screens/notifications.dart';
import 'package:beta_home/screens/profile.dart';
import 'package:beta_home/screens/sales_workforce.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/screens/vision.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'FAQs.dart';
import 'aboutUs.dart';
import 'mission.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController progressCont;
  int currentIndex = 0;
  final CarouselController _controller = CarouselController();
  List _slides = [];
  late TabController _tabController;
  List _items = [];
  bool _isLoading = true;
  // bool _paused = false;
  // late Timer _timer;

  @override
  void initState() {
    super.initState();
    getSliders();
    progressCont =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    progressCont.repeat(reverse: true);

    _tabController = TabController(initialIndex: 0, length: 7, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
    // _timer = Timer.periodic(Duration(seconds: 3), (timer) {
    //   _tabController.animateTo((_tabController.index + 1 % 7),
    //       duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    // });
    getPackages('');
  }

  @override
  void dispose() {
    progressCont.dispose();
    // _timer.cancel();
    _tabController.dispose();
    super.dispose();
  }

  Future getSliders() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.sliders);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _slides = json.data;
          });
        } else {
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured.');
    }
  }

  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onSearch(val) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
    }
    getPackages(val);
  }

  Future getPackages(String query) async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.packages}?q=$query');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _items = json.data;
            _isLoading = false;
          });
        } else {
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 20),
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 10),
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
                              backgroundImage: const NetworkImage(''),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NotificationsScreen()));
                        },
                        child: Stack(
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
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      TextField(
                        cursorColor: Colors.black,
                        maxLines: 1,
                        onChanged: _onSearch,
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search what you need',
                            hintStyle:
                                const TextStyle(color: Color(0xffAEAEAE)),
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Stack(
                    children: [
                      TabBar(
                        isScrollable: true,
                        onTap: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        physics: NeverScrollableScrollPhysics(),
                        labelColor: Colors.black,
                        indicatorColor: const Color(0xFFFFDA58),
                        indicatorWeight: 1,
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            text: 'Explore',
                          ),
                          Tab(
                            text: 'About Us',
                          ),
                          Tab(text: 'Beta Ambassador'),
                          Tab(text: 'Beta Help'),
                          Tab(text: 'Vision'),
                          Tab(text: 'Mission'),
                          Tab(text: 'FAQ'),
                        ],
                      ),
                      
                      currentIndex > 0
                          ? Positioned(
                              top: 5,
                              left: 2.2,
                              child: GestureDetector(
                                // onTap: () {
                                //   _tabController.animateTo(0);
                                // },
                                child: Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade100,
                                          blurRadius: 4,
                                          spreadRadius: 2)
                                    ],
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Center(
                                    child: Icon(
                                      size: 20,
                                      Icons.chevron_left,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      currentIndex < 6
                          ? Positioned(
                              top: 5,
                              right: 2.2,
                              child: GestureDetector(
                                // onTap: () {
                                //   _tabController.animateTo(6);
                                // },
                                child: Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade100,
                                          blurRadius: 4,
                                          spreadRadius: 2)
                                    ],
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Center(
                                    child: Icon(
                                      size: 20,
                                      Icons.chevron_right,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10, right: 10,
                      ),
                      child: TabBarView(
                        controller: _tabController,
                        physics:BouncingScrollPhysics(),
                        children: const [
                          Explore(),
                          AboutUs(),
                          SalesWorkforce(),
                          BetaHelp(),
                          Vision(),
                          Mission(),
                          FAQ()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
