import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/market_item.dart';
import 'package:beta_home/widgets/market_card.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  List _items = [];
  List<Widget> _rows = [];

  var items = {
    'Electronics': [
      {
        "_id": "34567890",
        "name": "32 Inchs LG TV",
        "description": "This is a TV set",
        "price": "230000",
        "picture":
            "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
        "categories": null
      },
      {
        "_id": "34567890",
        "name": "32 Inchs LG TV",
        "description": "This is a TV set",
        "price": "240000",
        "picture":
            "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
        "categories": null
      },
      {
        "_id": "34567890",
        "name": "32 Inchs LG TV",
        "description": "This is a TV set",
        "price": "250000",
        "picture":
            "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
        "categories": null
      },
    ],
    'Fashion': [
      {
        "_id": "34567890",
        "name": "32 Inchs LG TV",
        "description": "This is a TV set",
        "price": "230000",
        "picture":
            "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
        "categories": null
      },
      {
        "_id": "34567890",
        "name": "32 Inchs LG TV",
        "description": "This is a TV set",
        "price": "240000",
        "picture":
            "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
        "categories": null
      },
      {
        "_id": "34567890",
        "name": "32 Inchs LG TV",
        "description": "This is a TV set",
        "price": "250000",
        "picture":
            "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
        "categories": null
      },
    ]
  };

  @override
  void initState() {
    super.initState();
    getItems();

    List<Widget> rows = <Widget>[];
    items.forEach((key, value) {
      // print('${key}:${value}');
      // List<dynamic> arr = jsonDecode(value);
      rows.add(itemRow(key, value));
      // for (var i = 0; i < value.length; i++) {
      //   // MarketItem item = MarketItem.fromJson(arr[0]);
      //   MarketItem item = MarketItem.fromJson(value[i]);
      //   print(':::::::::::::::::::::::::::${item.price}');
      // }
      setState(() {
        _rows = rows;
      });
    });
  }

  Widget itemRow(String key, List items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(key),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items.map((_item) {
              MarketItem item = MarketItem.fromJson(_item);
              return Column(
                children: [
                  Text(item.name),
                  Text('N${item.name}'),
                  Text('N${item.name}'),
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getItems() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.market}/items');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _items = json.data;
          });
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: _rows,
    )
        // Center(
        //   child:
        //     Column(
        //   children: <Widget>[
        //     Container(
        //       height: 200,
        //       margin: const EdgeInsets.symmetric(vertical: 10.0),
        //       padding: const EdgeInsets.symmetric(horizontal: 5.0),
        //       child: GridView.builder(
        //         itemCount: _items.length,
        //         itemBuilder: (context, index) => galleryCard(
        //             context, index, MarketItem.fromJson(_items[index])),
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           mainAxisSpacing: 8,
        //           crossAxisSpacing: 8,
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(top: 40.0),
        //       child: Image.network(
        //           "https://www.kindpng.com/picc/m/393-3933271_advertising-logo-png-transparent-png.png"),
        //     ),
        //   ],
        // ),
        // ),
        );
  }
}
