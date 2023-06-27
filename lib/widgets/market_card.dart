import 'package:beta_home/models/listing_item.dart';
import 'package:beta_home/screens/listing_item_details.dart';
import 'package:flutter/material.dart';

Widget galleryCard(context, int index, ListingItem item) => Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListingItemDetails(item: item),
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${item.picture.toString()}'),//'${UrlHelper.file}/${_items[index]['items'][itemindex]['cover_pic'].toString()}'
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
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  'N${item.price}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xffF55859),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
