import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/market_item.dart';
import 'package:beta_home/screens/my_cart.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/market_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collection/collection.dart';

const productCategories = ['Recommended', 'Chairs', 'Tables', 'Couchs'];

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  List _items = [];
  String _category = "Recommended";

  Future getItems() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.market}/items');
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
      Fluttertoast.showToast(msg: 'Error.', toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

  void _onCategorySelected(val) {
    setState(() {
      _category = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search what you need',
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
                      )),
                  Dot(),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Color(0xff000000),
                  ),
                  Dot(),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
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
              children: productCategories
                  .mapIndexed((index, item) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: OutlinedButton(
                          onPressed: () => _onCategorySelected(item),
                          style: OutlinedButton.styleFrom(
                              primary: const Color(0xff2F2E41),
                              side: const BorderSide(
                                  color: Color(0xffD9D9D9), width: 1),
                              backgroundColor: _category == item
                                  ? const Color(0xffFFDA58)
                                  : const Color(0xffFAFAFA)),
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => galleryCard(
                  context, index, MarketItem.fromJson(_items[index])),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
