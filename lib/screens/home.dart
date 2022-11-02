import 'dart:convert';

import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/explore.dart';
import 'package:beta_home/screens/beta_help.dart';
import 'package:beta_home/screens/sales_workforce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController progressCont;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List _slides = [];
  late TabController _tabController;

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    progressCont.dispose();
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = _slides
        .map((item) => ClipRRect(
                // borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
              children: <Widget>[
                Image.network('${UrlHelper.image}?key=${item['key']}',
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(100, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      '${item['text']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )))
        .toList();

    return Consumer<DataModel>(builder: (context, data, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                    // height: 230,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayCurve: Curves.linear,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: _slides.asMap().entries.map((entry) {
                        return Container(
                          width: 4.0,
                          height: 4.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: const Color(0xFFFFDA58),
                    indicatorWeight: 1,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Explore',
                      ),
                      Tab(
                        text: 'Beta Help',
                      ),
                      Tab(text: 'Sales Workforce')
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TabBarView(
                          controller: _tabController,
                          children: const [
                            Explore(),
                            BetaHelp(),
                            SalesWorkforce(),
                          ]),
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
