import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/market_item.dart';
import 'package:beta_home/screens/new_listing.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/market_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collection/collection.dart';

class MyStore extends StatefulWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  List _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future getProducts() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.market}/my/products');
      print(resp['status']);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        print(resp['data']);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Store',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        centerTitle: false,
        titleTextStyle: const TextStyle(color: Color(0xff000000)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: TextButton.icon(
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: BotomSheet.shape(),
                  context: context,
                  builder: (context) =>
                      BotomShet.listingTypes((val) => {print(val)}),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                ),
                label: const Text(
                  'New Listing',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  backgroundColor: const Color(0xffFFDA58).withOpacity(0.7),
                ),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: getProducts,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            // vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'My Listings',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              if (_items.isEmpty)
                const Expanded(
                    child: Center(
                  child: Text(
                    'Your listings will show here',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black45),
                  ),
                ))
              else
                Expanded(
                  child: GridView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) => galleryCard(
                      context,
                      index,
                      MarketItem.fromJson(_items[index]),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
