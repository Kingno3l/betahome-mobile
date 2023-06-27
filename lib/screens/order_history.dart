import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/order_item.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List _items = [];
  OrderItem? _selected;
  bool sort_ascending = false;
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  bool rotate = false;

  @override
  void initState() {
    startDateInput.text = ""; //set the initial value of text field
    endDateInput.text = "";
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
                  onTap: () {
                    setState(() {
                      sort_ascending = !sort_ascending;
                      rotate = !rotate;
                    });
                  },
                  child: RotatedBox(
                    quarterTurns: rotate ? 2 : 0,
                    child: SvgPicture.asset(
                        './lib/assets/icons/svgs/sort_ascending.svg'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: startDateInput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          startDateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                    cursorHeight: 0,
                    cursorWidth: 0,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      filled: true,
                      fillColor: Color(0xffF4F4F4),
                      hintText: "Start",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.calendar_month_rounded,
                          size: 18, color: Colors.grey),
                    ),
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
                  child: TextField(
                    controller: endDateInput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          endDateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                    cursorHeight: 0,
                    cursorWidth: 0,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                      filled: true,
                      fillColor: Color(0xffF4F4F4),
                      hintText: "End",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.calendar_month_rounded,
                          size: 18, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              reverse: sort_ascending,
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(12),
        ),
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
