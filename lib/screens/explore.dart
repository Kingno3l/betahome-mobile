import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/listing_item.dart';
import 'package:beta_home/widgets/explore_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../helper/utils.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  List _items = [];
  List _bestpicked = [];
  List _latest = [];
  List _banners = [];
  List<Widget> _rows = [];
  final List _slides = [];
  int _current = 0;
  final bool _isthereData =
      true; //dummy data just to remove the null in the explore page

  @override
  void initState() {
    super.initState();
    getHomeItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getHomeItems() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.homeExplore);
      if (resp['status'] == 200) {
        if (resp['data']['status'] == 'success') {
          final HttpResp json = HttpResp.fromJson(resp['data']);
          //   print(json.data['best_picked']);
          setState(() {
            _bestpicked = json.data['best_picked'];
            _latest = json.data['latest'];
            _banners = json.data['banners'];
          });
        } else {
          // Utils.showToast(json_bestPicked.msg);
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Best pick for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See all >>",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ), //['data']['best_picked']
          ),
          _isthereData
              ? Container(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _bestpicked.length,
                    itemBuilder: (context, index) => exploreCard(
                      context,
                      index,
                      ListingItem.fromJson(_bestpicked[index]),
                    ),
                  ),
                )
              : Container(
                height: 170,
              ),

          //carousel
          Stack(
            children: [
              CarouselSlider(
                items: _banners.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ), //['picture']
                        child: Image.network(
                          '${UrlHelper.file}/${image['picture']}',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  // height: 230,
                  viewportFraction: 1.0,
                  height: 100.0,
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
                            color:
                                (Theme.of(context).brightness == Brightness.dark
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
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Latest",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See all >>",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          _isthereData
              ? Container(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _latest.length,
                    itemBuilder: (context, index) => exploreCard(
                      context,
                      index,
                      ListingItem.fromJson(_latest[index]),
                    ),
                  ),
                )
              : Container(
                height: 170,
              ),
        ],
      ),
    );
  }
}
