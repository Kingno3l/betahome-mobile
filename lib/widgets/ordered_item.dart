import 'package:beta_home/models/listing_item.dart';
import 'package:flutter/material.dart';

Container OrderedItem(ListingItem item, Function? onRemove,
    {bool hidePMBts = false}) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.only(top: 8),
    decoration: const BoxDecoration(
      color: Color(0xffF4F4F4),
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    child: IntrinsicHeight(
      child: Row(
        children: [
          if (item.picture != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image(
                width: 90,
                height: 90,
                fit: BoxFit.fill,
                image: NetworkImage(item.picture),
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'N${item.price}',
                      // maxLines: 4,
                      // overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xffF55859)),
                    ),
                  ],
                ),
                if (!hidePMBts)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton(
                            onPressed: null,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xff505050),
                              ),
                              shape: const CircleBorder(),
                              // backgroundColor:
                              //     const Color(0xffDADADA),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 15,
                              color: Color(0xff505050),
                            ),
                          ),
                          // Text('${item.quantity()}'),
                          const Text('1'),
                          OutlinedButton(
                            onPressed: null,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1, color: Color(0xff505050)),
                              shape: const CircleBorder(),
                              // backgroundColor:
                              //     const Color(0xffDADADA),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xff505050),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                          visible: onRemove != null,
                          child: OutlinedButton(
                            onPressed: () => onRemove!(),
                            style: OutlinedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xffDADADA),
                            ),
                            child: const Icon(
                              Icons.delete,
                              size: 15,
                              color: Color(0xff505050),
                            ),
                          ))
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
