import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/transaction_item.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:beta_home/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List _items = [];

  @override
  void initState() {
    super.initState();
    getTransactions();
  }

  Future getTransactions() async {
    try {
      final resp = await ServerHelper.get(UrlHelper.transactions);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Transactions'),
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
            children: [
              const Text(
                'July',
                style: TextStyle(
                  color: Color(0xff696969),
                ),
              ),
              ..._items
                  .mapIndexed(
                    (index, item) =>
                        transactionRow(TransactionItem.fromJson(item)),
                  )
                  .toList()
            ],
          )),
        ],
      ),
    );
  }
}
