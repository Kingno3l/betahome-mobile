import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/history_item.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/order_item.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List _items = [];

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  Future getOrders() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.orders);
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
      Fluttertoast.showToast(msg: 'Error.', toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Order History'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                InkWell(
                  child: SvgPicture.asset(
                      './lib/assets/icons/svgs/sort_ascending.svg'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        // shape: RoundedRectangleBorder(borderRadius: ),
                        alignment: Alignment.centerLeft,
                        backgroundColor: const Color(0xffF4F4F4)),
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      size: 18,
                    ),
                    label: const Text('Start'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  'to',
                  style: TextStyle(),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        // shape: RoundedRectangleBorder(borderRadius: ),
                        alignment: Alignment.centerLeft,
                        backgroundColor: const Color(0xffF4F4F4)),
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      size: 18,
                    ),
                    label: const Text('End'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: _items
                  .mapIndexed(
                    (index, item) => listItem(OrderItem.fromJson(item)),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Container listItem(OrderItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xffF4F4F4),
      child: Row(
        children: [
          Image(
            image: AssetImage(item.picture),
            // alignment: Alignment.center,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.itemName,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      item.status == 1
                          ? Icons.check_circle_sharp
                          : Icons.cancel,
                      size: 16,
                      color: Color(item.status == 1 ? 0xff4BD37B : 0xffFF0000),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'N${item.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      item.time,
                      style: const TextStyle(
                        color: Color(0xff696969),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
