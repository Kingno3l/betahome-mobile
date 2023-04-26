import 'package:beta_home/models/listing_item.dart';
import 'package:beta_home/screens/listing_item_details.dart';

import 'package:flutter/material.dart';


Widget exploreCard(context, int index, ListingItem item) => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Card(
    color: Colors.white,
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
                      fit: BoxFit.contain,
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
                alignment: Alignment.bottomLeft,
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
      ),
);
