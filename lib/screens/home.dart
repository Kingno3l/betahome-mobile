import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/profile.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/widgets/beta_office.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:beta_home/widgets/beta_home.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController progressCont;
  int _tabIndex = 0;
  List _items = [];
  bool _isLoading = true;

  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  String _currentMenu = 'explore';

  @override
  void initState() {
    progressCont =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    progressCont.repeat(reverse: true);

    super.initState();

    getPackages('');
  }

  @override
  void dispose() {
    progressCont.dispose();
    super.dispose();
  }

  void _onSearch(val) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
    }
    getPackages(val);
  }

  Future getPackages(String query) async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.packages}?q=$query');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
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

  void _onTabSelected(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<PlutoMenuItem> getMenus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: 'ABOUT US',
        onTap: () {
          setState(() {
            _currentMenu = 'about';
          });
        },
      ),
      PlutoMenuItem(
        title: 'EXPLORE',
        onTap: () {
          setState(() {
            _currentMenu = 'explore';
          });
        },
      ),
      PlutoMenuItem(
        title: 'SALES WORKFORCE',
        onTap: () {
          setState(() {
            _currentMenu = 'workforce';
          });
        },
      ),
      PlutoMenuItem(
        title: 'BETA HELP',
        onTap: () {
          setState(() {
            _currentMenu = 'betahelp';
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = images
        .map((item) => Container(
              // margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  // borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(100, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${images.indexOf(item)} image',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              // ),
            ))
        .toList();

    Widget content(menu) {
      if (menu == 'about') {
        return const Text('About Us');
      } else if (menu == 'explore') {
        return const Text('Explore');
      } else if (menu == 'workforce') {
        return const Text('Workforce');
      } else {
        return const Text('Beta Help');
      }
    }

    return Consumer<DataModel>(builder: (context, data, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayCurve: Curves.elasticIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: images.asMap().entries.map((entry) {
                        return Container(
                          width: 4.0,
                          height: 4.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),

            // Container(
            //   padding: const EdgeInsets.only(
            //       left: 10, right: 10, bottom: 10, top: 10),
            //   margin: const EdgeInsets.only(top: 10, bottom: 10),
            //   decoration: const BoxDecoration(
            //       color: Color(0xffFFF6D6),
            //       borderRadius: BorderRadius.all(Radius.circular(8))),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           Expanded(
            //             child: Row(
            //               children: [
            //                 CircleAvatar(
            //                   backgroundColor: Colors.transparent,
            //                   backgroundImage: const NetworkImage(
            //                       'https://img.icons8.com/ios-glyphs/60/95A5A6/test-account.png'),
            //                   radius: 20,
            //                   child: Material(
            //                     shape: const CircleBorder(),
            //                     clipBehavior: Clip.hardEdge,
            //                     color: Colors.transparent,
            //                     child: InkWell(
            //                       onTap: () => {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                             builder: (context) =>
            //                                 data.profile == null
            //                                     ? const SignIn()
            //                                     : const Profile(),
            //                           ),
            //                         )
            //                       },
            //                     ),
            //                   ),
            //                 ),
            //                 const SizedBox(width: 10),
            //                 Text(
            //                   'Welcome${data.profile != null ? ', ${data.profile?.first_name}' : ''}',
            //                   style: const TextStyle(
            //                     color: Color(0xff000000),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
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
            //         onChanged: _onSearch,
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
            //               size: 18,
            //               color: Color(0xffAEAEAE),
            //             )),
            //         style: const TextStyle(
            //           fontSize: 15,
            //           color: Color(0xff000000),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 38,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: const Color(0xffD9D9D9), width: 1.5),
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(5),
            //     ),
            //   ),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 1,
            //         child: TextButton(
            //           onPressed: () => _onTabSelected(0),
            //           style: TextButton.styleFrom(
            //               padding: const EdgeInsets.symmetric(vertical: 0),
            //               backgroundColor: _tabIndex == 0
            //                   ? const Color(0xffFFF6D6)
            //                   : const Color(0xffFAFAFA)),
            //           child: const Text(
            //             'BetaHome Furniture',
            //             textAlign: TextAlign.center,
            //             style:
            //                 TextStyle(color: Color(0xff2F2E41), fontSize: 12),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //           flex: 1,
            //           child: TextButton(
            //             onPressed: () => _onTabSelected(1),
            //             style: TextButton.styleFrom(
            //                 padding: const EdgeInsets.symmetric(vertical: 0),
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
            PlutoMenuBar(
              menus: getMenus(context),
              textStyle: const TextStyle(fontSize: 12),
              indicatorColor: const Color(0xffFFDA58),
            ),
            SizedBox(
              height: 3,
              child: _isLoading
                  ? LinearProgressIndicator(
                      color: const Color(0xffcccccc),
                      backgroundColor: const Color(0xff999999),
                      minHeight: 3,
                      value: progressCont.value,
                      semanticsLabel: 'Loading...',
                    )
                  : null,
            ),
            // const SizedBox(
            //   height: 6,
            // ),
            // Expanded(
            //   child: BetaHome(items: _items),
            // ),
            content(_currentMenu),
          ],
        ),
      );
    });
  }
}

enum _RadioItems {
  one,
  two,
  three,
}
