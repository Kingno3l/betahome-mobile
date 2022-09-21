import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:beta_home/widgets/beta_home.dart';
import 'package:collection/collection.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List _items = [];

  @override
  void initState() {
    super.initState();
    getServices();
  }

  Future getServices() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.services);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _items = json.data;
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

  void onServiceClick(context, item) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => PackageDetails(
    //       package: Package.fromJson(item),
    //     ),
    //   ),
    // );
  }

  Widget serviceTitle(title, color, isShow, onPress) {
    if (!isShow) return const SizedBox(width: 0);

    return Flexible(
      flex: 1,
      child: Container(
        color: Color(int.parse(color)),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: InkWell(
            onTap: onPress,
            child: Center(
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            )),
      ),
    );
  }

  IntrinsicHeight itemRow(context, index, package) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          serviceTitle(package['name'], package['color'], index % 2 == 0,
              () => onServiceClick(context, package)),
          ...package['items'].map((item) => Expanded(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: index % 2 == 0 ? 5 : 0,
                    ),
                    Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => onServiceClick(context, package),
                          child: Image(
                            width: double.infinity,
                            image: AssetImage(item['picture']),
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(
                      width: index % 2 != 0 ? 5 : 0,
                    ),
                    SizedBox(
                      width: index % 2 != 0 ? 5 : 0,
                    ),
                  ],
                ),
              )),
          serviceTitle(package['name'], package['color'], index % 2 != 0,
              () => onServiceClick(context, package))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BetaHelp',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          titleTextStyle: const TextStyle(color: Color(0xff000000)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
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
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(1.0),
                          filled: true,
                          fillColor: const Color(0xffEDEDED),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 18,
                            color: Color(0xffAEAEAE),
                          )),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: _items
                      .mapIndexed((index, item) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: itemRow(context, index, item),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
