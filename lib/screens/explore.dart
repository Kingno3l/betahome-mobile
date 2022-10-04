import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/market_item.dart';
import 'package:beta_home/widgets/market_card.dart';
import 'package:flutter/material.dart';

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExploreState();
}

class _ExploreState extends State<explore> with TickerProviderStateMixin {
  List _items = [];

  @override
  void initState() {
    super.initState();
    getItems();
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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.network(
                  "https://www.kindpng.com/picc/m/393-3933271_advertising-logo-png-transparent-png.png"),
            ),
          ],
        ),
      ),
    );
  }
}
