import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:beta_home/widgets/beta_home.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServicesState();
}

// Future <List<Package>> getPackages() async {
Future getPackages() async {
  try {
    // final resp =
    //     await http.get(Uri.parse('www.googleapis.com/books/v1/volumes'));
    // final resp = await http.get(Uri.parse(UrlHelper.packages));
    // print(resp.statusCode);
    // print(resp.body);

    final response = await Dio().get('localhost:3000');
    print(response.data);
  } catch (e) {
    print(e);
  }
}

class _ServicesState extends State<Services> {
  int _tabIndex = 0;
  // Future <List<Package>> packages;
  static final List _data = [
    {
      'uid': 'pk001',
      'package_name': 'Beta Basic',
      'description': 'Beta Pro offers you a Pro package of',
      'color': 0xffD4FFDB,
      'price': 150000.0,
      'items': [
        {
          'uid': 'item001',
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'quantity': 1,
          'picture': './lib/assets/imgs/remove.png'
        },
        {
          'uid': 'item002',
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'quantity': 2,
          'picture': './lib/assets/imgs/remove2.png'
        },
      ]
    },
    {
      'uid': 'pk002',
      'package_name': 'Beta Combo',
      'description': 'Beta Pro offers you a Pro package of',
      'color': 0xffFFF6D6,
      'price': 110000.0,
      'items': [
        {
          'uid': 'item003',
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'quantity': 2,
          'picture': './lib/assets/imgs/remove3.png'
        },
      ]
    },
    {
      'uid': 'pk003',
      'package_name': 'Beta Pro',
      'description': 'Beta Pro offers you a Pro package of',
      'color': 0xffE2E0FF,
      'price': 130000.0,
      'items': [
        {
          'uid': 'item004',
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'quantity': 10,
          'picture': './lib/assets/imgs/remove4.png'
        },
        {
          'uid': 'item007',
          'title': 'Multiple set of furnitures',
          'description':
              'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Quisque velit nis.',
          'quantity': 1,
          'picture': './lib/assets/imgs/remove7.png'
        },
      ]
    },
    {
      'uid': 'pk004',
      'package_name': 'Beta Pro-Max',
      'description': 'Beta Pro offers you a Pro package of',
      'color': 0xffF5F2F2,
      'price': 250000.0,
      'items': [
        {
          'uid': 'item005',
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'quantity': 2,
          'picture': './lib/assets/imgs/remove5.png'
        },
        {
          'uid': 'item006',
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'quantity': 3,
          'picture': './lib/assets/imgs/remove6.png'
        },
      ]
    },
    {
      'uid': 'pk004',
      'package_name': 'Beta Pro-Max',
      'description': 'Beta Pro offers you a Pro package of',
      'color': 0xffF5F2F2,
      'price': 250000.0,
      'items': [
        {
          'uid': 'item005',
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'quantity': 2,
          'picture': './lib/assets/imgs/remove5.png'
        },
        {
          'uid': 'item006',
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'quantity': 3,
          'picture': './lib/assets/imgs/remove6.png'
        },
      ]
    },
    {
      'uid': 'pk004',
      'package_name': 'Beta Pro-Max',
      'description': 'Beta Pro offers you a Pro package of',
      'color': 0xffF5F2F2,
      'price': 250000.0,
      'items': [
        {
          'uid': 'item005',
          'title': '2-Sitter chairs',
          'description': 'Select the best furniture for your apartment',
          'quantity': 2,
          'picture': './lib/assets/imgs/remove5.png'
        },
        {
          'uid': 'item006',
          'title': 'Single Sitter chair',
          'description': 'Select the best furniture for your apartment',
          'quantity': 3,
          'picture': './lib/assets/imgs/remove6.png'
        },
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    // packages =
    getPackages();
  }

  void _onTabSelected(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
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
                    fillColor: const Color(0xffEDEDED),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 16,
                      color: Color(0xffAEAEAE),
                    )),
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff000000),
                ),
              )),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Color(0xff000000),
                  ),
                  Dot(),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Color(0xff000000),
                  ),
                  Dot(),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   margin: const EdgeInsets.only(top: 10, bottom: 10),
          //   decoration: const BoxDecoration(
          //       color: Color(0xffFFF6D6),
          //       borderRadius: BorderRadius.all(Radius.circular(8))),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Expanded(
          //               child: Row(children: const [
          //             CircleAvatar(
          //               radius: 24,
          //               child: Image(
          //                 image: AssetImage('./lib/assets/imgs/dp.png'),
          //                 height: 60,
          //                 // width: 220,
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //             SizedBox(width: 15),
          //             Text(
          //               'Welcome, Jeffrey',
          //               style: TextStyle(color: Color(0xff000000)),
          //             )
          //           ])),
          //           Stack(
          //             children: [
          //               const Icon(
          //                 Icons.notifications,
          //                 color: Color(0xff000000),
          //               ),
          //               Container(
          //                 width: 6,
          //                 height: 6,
          //                 margin: const EdgeInsets.only(left: 15, top: 2),
          //                 decoration: const BoxDecoration(
          //                     color: Color(0xffFF0000),
          //                     borderRadius:
          //                         BorderRadius.all(Radius.circular(3))),
          //               )
          //             ],
          //           )
          //         ],
          //       ),
          //       const SizedBox(height: 15),
          //       TextField(
          //         cursorColor: Colors.black,
          //         maxLines: 1,
          //         decoration: InputDecoration(
          //             isDense: true,
          //             hintText: 'Search what you need',
          //             hintStyle: const TextStyle(color: Color(0xffAEAEAE)),
          //             // border: InputBorder.none,
          //             border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(10.0),
          //                 borderSide: BorderSide.none),
          //             filled: true,
          //             fillColor: const Color(0xffffffff),
          //             prefixIcon: const Icon(
          //               Icons.search,
          //               size: 16,
          //               color: Color(0xffAEAEAE),
          //             )),
          //         style: const TextStyle(
          //           fontSize: 13,
          //           color: Color(0xff000000),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(color: const Color(0xffD9D9D9), width: 1.5),
          //       borderRadius: const BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [
          //       Expanded(
          //           flex: 1,
          //           child: TextButton(
          //             onPressed: () => _onTabSelected(0),
          //             style: TextButton.styleFrom(
          //                 padding: const EdgeInsets.symmetric(vertical: 20),
          //                 backgroundColor: _tabIndex == 0
          //                     ? const Color(0xffFFF6D6)
          //                     : const Color(0xffFAFAFA)),
          //             child: const Text(
          //               'BetaHome Furniture',
          //               textAlign: TextAlign.center,
          //               style:
          //                   TextStyle(color: Color(0xff2F2E41), fontSize: 12),
          //             ),
          //           )),
          //       Expanded(
          //           flex: 1,
          //           child: TextButton(
          //             onPressed: () => _onTabSelected(1),
          //             style: TextButton.styleFrom(
          //                 padding: const EdgeInsets.symmetric(vertical: 20),
          //                 backgroundColor: _tabIndex == 1
          //                     ? const Color(0xffFFF6D6)
          //                     : const Color(0xffFAFAFA)),
          //             child: const Text(
          //               'BetaOffice Furniture',
          //               textAlign: TextAlign.center,
          //               style:
          //                   TextStyle(color: Color(0xff2F2E41), fontSize: 12),
          //             ),
          //           )),
          //     ],
          //   ),
          // ),
          Expanded(
              child:
                  _tabIndex == 0 ? BetaHome(items: _data) : const BetaOffice())
        ],
      ),
    );
    ;
  }
}

class BetaOffice extends StatelessWidget {
  const BetaOffice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Beta Office');
  }
}
