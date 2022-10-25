import 'package:flutter/material.dart';

@immutable
abstract class BotomShet {
  static Padding productCategories(List items, Function(dynamic) onSelect) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Text('Select category'),
          ),
          ...items.map(
            (item) => InkWell(
              onTap: onSelect(item),
              child: const Text('data'),
            ),
          ),
        ],
      ),
    );
  }

  static Padding listingTypes(Function Function(dynamic) onSelect) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Text('Choose listing type'),
          ),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              SizedBox(
                width: 160,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () => onSelect(2),
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NewListing(
                    //         typeId: '63569bbfc3acaa4ec269aaf5',
                    //         typeTitle: 'Item for sale'),
                    //   ),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffffc9d9),
                            ),
                            child: const Icon(Icons.production_quantity_limits),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              'Item for sale',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            'Create a single listing for one or more items to sell.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NewListing(
                    //         typeId: '63569c09c3acaa4ec269aaf6',
                    //         typeTitle: 'Vehicle for sale'),
                    //   ),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffb5ede5),
                            ),
                            child: const Icon(Icons.production_quantity_limits),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              'Vehicle for sale',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            'Sell a car, van or other type of vehicle.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NewListing(
                    //         typeId: '63569c36c3acaa4ec269aaf7',
                    //         typeTitle: 'Property for sale or rent'),
                    //   ),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xfffeebd8),
                            ),
                            child: const Icon(Icons.production_quantity_limits),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              'Property for sale or rent',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            'List a house or flat for sale or rent.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
