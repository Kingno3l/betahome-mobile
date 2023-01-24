import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/history_item.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/order_item.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
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
  OrderItem? _selected;

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
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error');
      }
    } catch (e) {
      Utils.showToast('An error occured');
    }
  }

  void showDetail() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: BotomSheet.shape(),
      context: context,
      builder: (context) => BotomShet.orderDetails(context, _selected),
    );
  }

  Future onSelected(OrderItem order) async {
    showDetail();

    try {
      final resp = await ServerHelper.get(
          '${UrlHelper.orders}/${order.type}/${order.longID}');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _selected = OrderItem.fromJson(json.data);
          });
          if (!mounted) return;
          Navigator.pop(context);
          showDetail();
        } else {
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error');
      }
    } catch (e) {
      Utils.showToast('An error occured');
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
                    (index, item) => listItem(
                      OrderItem.fromJson(item),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  InkWell listItem(OrderItem item) {
    return InkWell(
      onTap: () => onSelected(item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.only(bottom: 10),
        color: const Color(0xffF4F4F4),
        child:
            // Row(
            //   children: [
            // Image(
            //   image: AssetImage(item.picture),
            //   // alignment: Alignment.center,
            //   height: 70,
            //   width: 70,
            //   fit: BoxFit.cover,
            // ),
            // const SizedBox(
            //   width: 12,
            // ),
            //   Expanded(
            // child:
            Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item.type} Order'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                ),
                const Text(' | '),
                Text(
                  item.id,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Text(
                    item.date,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Color(0xff696969),
                      fontSize: 11,
                    ),
                  ),
                ),
                // Icon(
                //   item.status == 1 ? Icons.check_circle_sharp : Icons.cancel,
                //   size: 16,
                //   color: Color(item.status == 1 ? 0xff4BD37B : 0xffFF0000),
                // ),
              ],
            ),
            const SizedBox(
              height: 15,
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: item.isPaid
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                  ),
                  child: Text(
                    item.isPaid ? 'Paid' : 'Unpaid',
                    style: TextStyle(
                      color: item.isPaid
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // ),
        //   ],
        // ),
      ),
    );
  }
}
