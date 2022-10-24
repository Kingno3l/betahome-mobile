import 'package:beta_home/models/market_item.dart';
import 'package:beta_home/screens/market_item_details.dart';
import 'package:flutter/material.dart';

Widget galleryCard(context, int index, MarketItem item) => Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MarketItemDetails(item: item),
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.picture),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(item.isRated ? 0xffFFDA58 : 0xffD9D9D9),
                      // color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 13,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.name),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                'N${item.price}',
                style: const TextStyle(
                  color: Color(0xffF55859),
                ),
              ),
            ),
          ],
        ),
      ),
    );
