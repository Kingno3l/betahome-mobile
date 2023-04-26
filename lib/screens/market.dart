import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/market_item%20category.dart';
import 'package:beta_home/models/listing_item.dart';
import 'package:beta_home/screens/my_cart.dart';
import 'package:beta_home/screens/notifications.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/market_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MarketState();
}

class _MarketState extends State<Market> with TickerProviderStateMixin {
  late AnimationController progressCont;
  List _items = [];
  List _cats = [];
  String _category = '';
  String _query = '';
  final MarketItemCategory _recommeded = MarketItemCategory('', 'Recommended');
  bool _isLoading = true;

  @override
  void initState() {
    progressCont =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    progressCont.repeat(reverse: true);

    super.initState();
    getCats();
    getItems();
  }

  @override
  void dispose() {
    progressCont.dispose();
    super.dispose();
  }

  void _onSearch(val) {
    if (!_isLoading) {
      setState(() {
        _query = val;
        _isLoading = true;
      });
    }
    getItems();
  }

  Future getCats() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.market}/categories');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _cats = json.data;
          });
        }
      }
    } catch (e) {}
  }

  Future getItems() async {
    try {
      final url = '${UrlHelper.market}/items?q=$_query&cat=$_category';
      // print(url);
      final resp = await ServerHelper.get(url);
      // print(resp['status']);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        // print(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _items = json.data;
            _isLoading = false;
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

  void _onCategorySelected(MarketItemCategory val) {
    setState(() {
      _category = val.id;
    });
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  cursorColor: Colors.black,
                  maxLines: 1,
                  onChanged: _onSearch,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Search what you need...',
                      hintStyle: const TextStyle(color: Color(0xffAEAEAE)),
                      // border: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xffEDEDED),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 18,
                        color: Color(0xffAEAEAE),
                      )),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff000000),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCart(),
                        ),
                      ),
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Color(0xff000000),
                      ),
                    ),
                    Consumer<DataModel>(
                      builder: (context, data, child) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 9, top: 9),
                          child: data.cartItems.isEmpty ? null : Dot(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsScreen()));
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
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 3,
              child: _isLoading
                  ? LinearProgressIndicator(
                      color: const Color(0xffcccccc),
                      backgroundColor: const Color(0xff999999),
                      minHeight: 3,
                      value: progressCont.value,
                      semanticsLabel: 'Loading...',
                    )
                  : null,
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () => {},
              child: const Image(
                width: double.infinity,
                image: AssetImage('./lib/assets/imgs/remove8.png'),
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  catItem(_recommeded),
                  ..._cats
                      .mapIndexed(
                        (index, item) =>
                            catItem(MarketItemCategory.fromJson(item)),
                      )
                      .toList()
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) => galleryCard(
                  context,
                  index,
                  ListingItem.fromJson(_items[index]),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // updateCatItem() {
  //   return Expanded(
  //     child: GridView.builder(
  //       itemCount: _items.length,
  //       itemBuilder: (context, index) => galleryCard(
  //         context,
  //         index,
  //         ListingItem.fromJson(_items[index]),
  //       ),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         mainAxisSpacing: 8,
  //         crossAxisSpacing: 8,
  //       ),
  //     ),
  //   );
  // }

  Padding catItem(MarketItemCategory item) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        onPressed: () => _onCategorySelected(item),
        style: OutlinedButton.styleFrom(
          primary: const Color(0xff2F2E41),
          side: const BorderSide(color: Color(0xffD9D9D9), width: 1),
          backgroundColor: _category == item.id
              ? const Color(0xffFFDA58)
              : const Color(0xffFAFAFA),
        ),
        child: Text(
          item.name,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
