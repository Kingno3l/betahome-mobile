import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tabIndex = 0;
  static final List _data = [
    {
      'package_name': 'Beta Basic',
      'items': [
        {
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'picture': './lib/assets/imgs/remove.png'
        },
        {
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'picture': './lib/assets/imgs/remove2.png'
        },
      ]
    },
    {
      'package_name': 'Beta Combo',
      'items': [
        {
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'picture': './lib/assets/imgs/remove.png'
        },
      ]
    },
    {
      'package_name': 'Beta Pro',
      'items': [
        {
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'picture': './lib/assets/imgs/remove.png'
        },
      ]
    },
    {
      'package_name': 'Beta Pro-Max',
      'items': [
        {
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'picture': './lib/assets/imgs/remove.png'
        },
        {
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'picture': './lib/assets/imgs/remove.png'
        },
      ]
    },
  ];

  void _onTabSelected(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                    color: Color(0xffFFF6D6),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(children: const [
                          CircleAvatar(),
                          SizedBox(width: 15),
                          Text(
                            'Welcome, Jeffrey',
                            style: TextStyle(color: Color(0xff000000)),
                          )
                        ])),
                        Stack(
                          children: [
                            const Icon(
                              Icons.notifications,
                              color: Color(0xff000000),
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.only(left: 15, top: 2),
                              decoration: const BoxDecoration(
                                  color: Color(0xffFF0000),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextField(
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
                          fillColor: const Color(0xffffffff),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 16,
                            color: Color(0xffAEAEAE),
                          )),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff000000),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffD9D9D9), width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () => _onTabSelected(0),
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              backgroundColor: _tabIndex == 0
                                  ? const Color(0xffFFF6D6)
                                  : const Color(0xffFAFAFA)),
                          child: const Text(
                            'BetaHome Furniture',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff2F2E41), fontSize: 12),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () => _onTabSelected(1),
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              backgroundColor: _tabIndex == 1
                                  ? const Color(0xffFFF6D6)
                                  : const Color(0xffFAFAFA)),
                          child: const Text(
                            'BetaOffice Furniture',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff2F2E41), fontSize: 12),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                  child:
                      _tabIndex == 0 ? _BetaHome(items: _data) : BetaOffice())
            ],
          )),
    );
  }
}

class _BetaHome extends StatelessWidget {
  List items = [];

  _BetaHome({required this.items});

  Row itemRow(index, item) {
    // List packageItems = [2, 2];
    return Row(
      children: [
        index % 2 == 0
            ? Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Color(0xffD4FFDB)),
                      child: Text(
                        item['package_name'],
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ))
            : const SizedBox(
                width: 0,
              ),
        ...item['items'].map((item) => Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(
                    width: index % 2 == 0 ? 5 : 0,
                  ),
                  Image(
                    image: AssetImage(item['picture']),
                    // width: double.infinity,
                  ),
                  SizedBox(
                    width: index % 2 != 0 ? 5 : 0,
                  ),
                ],
              ),
            )),
        // const SizedBox(
        //   width: 10,
        // ),
        // const Expanded(
        //   flex: 1,
        //   child: Image(
        //     image: AssetImage('./lib/assets/imgs/remove.png'),
        //     // height: 8,
        //     // width: 60,
        //   ),
        // ),
        // const SizedBox(
        //   width: 10,
        // ),
        // const Expanded(
        //   flex: 1,
        //   child: Image(
        //     image: AssetImage('./lib/assets/imgs/remove2.png'),
        //     // height: 8,
        //     // width: 60,
        //   ),
        // ),
        index % 2 != 0
            ? Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Color(0xffD4FFDB)),
                      child: Text(
                        item['package_name'],
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ))
            : const SizedBox(
                width: 0,
              ),
        // ...packageItems.map((item) => const Expanded(
        //       flex: 1,
        //       child: Text(
        //         'Item',
        //         style: TextStyle(color: Colors.black),
        //       ),
        //     ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: items
          .mapIndexed((index, item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: itemRow(index, item),
              ))
          .toList(),
    );
  }
}

class BetaOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Beta Office');
  }
}
