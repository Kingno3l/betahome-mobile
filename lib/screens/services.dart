import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/screens/notifications.dart';
import 'package:beta_home/screens/profile.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/widgets/beta_office.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:beta_home/widgets/beta_home.dart';
import 'package:provider/provider.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServicesState();
}

class _ServicesState extends State<Services> with TickerProviderStateMixin {
  late AnimationController progressCont;
  int _tabIndex = 0;
  List _items = [];
  bool _isLoading = true;
  bool _getservices = false;

  @override
  void initState() {
    progressCont =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    progressCont.repeat(reverse: true);

    super.initState();

    getServices('');
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
    getServices(val);
  }

  Future getServices(String query) async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.services}');
      print(resp['status']);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _items = json.data;
            _isLoading = false;
            _getservices = true;
          });
        } else {
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured.');
    }
  }

  void _onTabSelected(index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer<DataModel>(builder: (context, data, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Services',
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationsScreen()));
                          },
                          child: Stack(
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
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    cursorColor: Colors.black,
                    maxLines: 1,
                    onChanged: _onSearch,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search what you need',
                        hintStyle: const TextStyle(color: Color(0xffAEAEAE)),
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey)),
                        filled: true,
                        fillColor: const Color(0xffffffff),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Color(0xffAEAEAE),
                        )),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xffD9D9D9), width: 1.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => _onTabSelected(0),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4)),
                              color: _tabIndex == 0
                                  ? const Color(0xffFFF6D6)
                                  : const Color(0xffFAFAFA)),
                          child: const Center(
                            child: Text(
                              'BetaHelp',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff2F2E41), fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => _onTabSelected(1),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                              color: _tabIndex == 1
                                  ? const Color(0xffFFF6D6)
                                  : const Color(0xffFAFAFA)),
                          child: const Center(
                            child: Text(
                              'Sales Workforce',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff2F2E41), fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              // SizedBox(
              //   height: 3,
              //   // child: _isLoading
              //   //     ? LinearProgressIndicator(
              //   //         color: const Color(0xffcccccc),
              //   //         backgroundColor: const Color(0xff999999),
              //   //         minHeight: 3,
              //   //         value: progressCont.value,
              //   //         semanticsLabel: 'Loading...',
              //   //       )
              //   //     : null,
              // ),
              // const SizedBox(
              //   height: 6,
              // ),
              // Expanded(
              //   child: _tabIndex == 0
              //       ? BetaHome(items: _items)
              //       : BetaOffice(items: _items),
              // ),
              _getservices
                  ? Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: GestureDetector(
                              onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PackageDetails(
                          //       package: Package.fromJson(item[index]),
                          //     ),
                          //   ),
                          // );
                        },
                              child: Visibility(
                                visible: index % 1 == 0,
                                child: Row(
                                  textDirection: index % 2 == 0
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      color: Color(
                                          int.parse(_items[index]['color'])),
                                      height: 120,
                                      width: 130,
                                      child: Center(
                                        child: Text(
                                          _items[index]['name'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 120,
                                        width: MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                          reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              _items[index]['artisans'].length,
                                          itemBuilder: (BuildContext context,
                                              int itemindex) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 8),
                                              child: Container(
                                                height: 120,
                                                width: 120,
                                                decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    '${UrlHelper.file}/${_items[index]['artisans'][itemindex]['dp'].toString()}'),
                                                fit: BoxFit.cover),
                                          ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(), //to handle if not logged in
            ],
          ),
        );
      }),
    );
  }
}






// import 'package:beta_home/helper/server_helper.dart';
// import 'package:beta_home/helper/url_helper.dart';
// import 'package:beta_home/helper/utils.dart';
// import 'package:beta_home/models/http_resp.dart';
// import 'package:beta_home/screens/service_details.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:collection/collection.dart';

// class Services extends StatefulWidget {
//   const Services({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _ServicesState();
// }

// class _ServicesState extends State<Services> {
//   List _items = [];

//   @override
//   void initState() {
//     super.initState();
//     getServices();
//   }

//   Future getServices() async {
//     try {
//       final resp = await ServerHelper.get('${UrlHelper.services}/provider');
//       if (resp['status'] == 200) {
//         final HttpResp json = HttpResp.fromJson(resp['data']);
//         if (json.status == 'success') {
//           setState(() {
//             _items = json.data;
//           });
//         } else {
//           Utils.showToast(json.msg);
//         }
//       } else {
//         Utils.showToast('Connection error.');
//       }
//     } catch (e) {
//       Utils.showToast('An error occured.');
//     }
//   }

//   void onServiceClick(context, item) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ServiceDetails(
//           service: item,
//         ),
//       ),
//     );
//   }

//   Widget serviceTitle(name, color, isShow, onPress) {
//     if (!isShow) return const SizedBox(width: 0);

//     return Flexible(
//       flex: 1,
//       child: Container(
//         color: Color(int.parse(color)),
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         child: InkWell(
//           onTap: onPress,
//           child: Center(
//             child: Text(
//               name,
//               style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   IntrinsicHeight itemRow(context, index, package) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           serviceTitle(
//             package['name'],
//             package['color'],
//             index % 2 == 0,
//             () => onServiceClick(context, package),
//           ),
//           ...package['users'].map(
//             (item) => Expanded(
//               flex: 1,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: index % 2 == 0 ? 5 : 0,
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: InkWell(
//                       onTap: () => onServiceClick(context, package),
//                       child: Image(
//                         width: double.infinity,
//                         image: NetworkImage(item['profile_pic'] ??
//                             '${UrlHelper.image}?key=${package['cover_pic']}'),
//                         alignment: Alignment.center,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: index % 2 != 0 ? 5 : 0,
//                   ),
//                   SizedBox(
//                     width: index % 2 != 0 ? 5 : 0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           serviceTitle(
//             package['name'],
//             package['color'],
//             index % 2 != 0,
//             () => onServiceClick(context, package),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: true,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'BetaHelp',
//             style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           centerTitle: false,
//           titleTextStyle: const TextStyle(color: Color(0xff000000)),
//         ),
//         body: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       cursorColor: Colors.black,
//                       maxLines: 1,
//                       decoration: InputDecoration(
//                         isDense: true,
//                         hintText: 'Search what you need',
//                         hintStyle: const TextStyle(color: Color(0xffAEAEAE)),
//                         // border: InputBorder.none,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.all(1.0),
//                         filled: true,
//                         fillColor: const Color(0xffEDEDED),
//                         prefixIcon: const Icon(
//                           Icons.search,
//                           size: 18,
//                           color: Color(0xffAEAEAE),
//                         ),
//                       ),
//                       style: const TextStyle(
//                         fontSize: 15,
//                         color: Color(0xff000000),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 4,
//               ),
//               Expanded(
//                 child: ListView(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   children: _items
//                       .mapIndexed(
//                         (index, item) => Padding(
//                           padding: const EdgeInsets.only(bottom: 8),
//                           child: itemRow(context, index, item),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
