import 'package:beta_home/models/market_item.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/screens/my_cart.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

class MarketItemDetails extends StatefulWidget {
  final MarketItem item;

  const MarketItemDetails({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MarketItemDetails();
}

class _MarketItemDetails extends State<MarketItemDetails> {
  @override
  Widget build(BuildContext context) {
    final MarketItem item = widget.item;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Row(
            children: [
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
            ],
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.getImgUrl()),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(item.isRated() ? 0xffFFDA58 : 0xffD9D9D9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.thumb_up,
                      color: Color(0xff2F2E41),
                      size: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                item.getName(),
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFDA58),
                      // color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '4.9',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '(145)',
                    style: TextStyle(color: Color(0xffAEAEAE)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'N${item.getPrice()}',
                style: const TextStyle(
                    color: Color(0xffF55859),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item.description,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      backgroundColor: const Color(0xFFFFDA58)),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
