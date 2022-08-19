import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/transaction_item.dart';
import 'package:beta_home/screens/transactions.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
      Fluttertoast.showToast(msg: 'Error.', toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'My wallet',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Text(
                    'Use our wallet system',
                    style: TextStyle(
                      color: Color(0xff696969),
                    ),
                  ),
                ],
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
        ),
        Expanded(
            child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                image: DecorationImage(
                  image: AssetImage('./lib/assets/icons/imgs/wallet_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const Text('Money balance',
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                  const Text(
                    'N 200,000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.arrow_circle_up_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: const Text(
                      'Top up',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: const Color(0xffFF5F00)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                    child: Text(
                  'Recent transactions',
                  style: TextStyle(
                    color: Color(0xff696969),
                  ),
                )),
                TextButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Transactions(),
                    ),
                  ),
                  icon: const Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xffFF0000),
                    ),
                  ),
                  label: const Icon(
                    Icons.chevron_right,
                    color: Color(0xffFF0000),
                  ),
                ),
              ],
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
    );
  }
}
