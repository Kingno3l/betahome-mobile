import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/market_item.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/screens/my_cart.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/market_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:beta_home/widgets/beta_home.dart';
import 'package:collection/collection.dart';

const productCategories = ['Recommended', 'Chairs', 'Tables', 'Couchs'];

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MarketState();
}

// Future <List<Package>> getPackages() async {
Future getPackages() async {
  try {
    // final resp =
    //     await http.get(Uri.parse('www.googleapis.com/books/v1/volumes'));
    // final resp = await http.get(Uri.parse(UrlHelper.packages));
    // print(resp.statusCode);
    // print(resp.body);

    final response = await Dio().get('localhost:3000');
    print(response.data);
  } catch (e) {
    print(e);
  }
}

class _MarketState extends State<Market> {
  String _category = "Recommended";
  // Future <List<Package>> packages;
  static final List _data = [
    MarketItem(
        111,
        'Dropdown fancy light',
        './lib/assets/imgs/remove7.png',
        'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Quisque velit nis.',
        5300,
        0),
    MarketItem(
        111,
        'Dropdown fancy light',
        './lib/assets/imgs/remove2.png',
        'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Quisque velit nis.',
        4500,
        1),
    MarketItem(
        111,
        'Dropdown fancy light',
        './lib/assets/imgs/remove11.png',
        'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Quisque velit nis.',
        5000,
        1),
    MarketItem(
        111,
        'Dropdown fancy light',
        './lib/assets/imgs/remove12.png',
        'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Quisque velit nis.',
        5000,
        0),
    MarketItem(
        111,
        'Dropdown fancy light',
        './lib/assets/imgs/remove.png',
        'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Quisque velit nis.',
        5000,
        1),
    MarketItem(
        111,
        'Dropdown fancy light',
        './lib/assets/imgs/remove4.png',
        'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Quisque velit nis.',
        5000,
        0),
  ];

  @override
  void initState() {
    super.initState();
    // packages =
    getPackages();
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
                      size: 16,
                      color: Color(0xffAEAEAE),
                    )),
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff000000),
                ),
              )),
              const SizedBox(
                width: 20,
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
                width: 20,
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
          // Flexible(
          //   flex: 1,
          //   child:
          InkWell(
            onTap: () => {},
            child: const Image(
              width: double.infinity,
              image: AssetImage('./lib/assets/imgs/remove8.png'),
              alignment: Alignment.center,
              fit: BoxFit.fill,
            ),
          ),
          // ),
          SizedBox(
            // width: double.infinity,
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
              itemCount: _data.length,
              itemBuilder: (context, index) =>
                  galleryCard(context, index, _data[index]),
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
