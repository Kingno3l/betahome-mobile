import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/transaction_item.dart';
import 'package:beta_home/screens/payment.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/screens/transactions.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

final CURRENCY_FORMAT = NumberFormat("#,##0.00", "en_US");

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  List _items = [];
  String _topUpAmount = '';

  @override
  void initState() {
    super.initState();
    getBalance();
    getTransactions();
  }

  Future getBalance() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.my}/wallet/balance');
      print(':::::::::::::::::getBalance::::::::::::::${resp['status']}');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          (() => Provider.of<DataModel>(context, listen: false).balance =
              json.data)();
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
          Utils.showToast(json.msg);
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured.');
    }
  }

  void _onNext() async {
    if (_topUpAmount == '') return;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Payment(
          amount: double.parse(_topUpAmount),
        ),
      ),
    );
    if (!mounted) return;
    print('RESULT:::::::::::::::::::::::::::::::::::$result');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Wallet',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                'Use our wallet system',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff696969),
                ),
              ),
            ],
          ),
          centerTitle: false,
          titleTextStyle: const TextStyle(color: Color(0xff000000)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Center(
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Color(0xff000000),
                    ),
                    Dot(),
                  ],
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: RefreshIndicator(
          onRefresh: getTransactions,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        image: DecorationImage(
                          image: AssetImage(
                              './lib/assets/icons/imgs/wallet_bg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text('Money balance',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                          Text(
                            NumberFormat.currency(name: '')
                                .format(data.balance),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Consumer<DataModel>(
                            builder: (context, data, child) {
                              return TextButton.icon(
                                onPressed: () => {
                                  data.profile == null
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn(),
                                          ),
                                        )
                                      : showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10.0),
                                            ),
                                          ),
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20,
                                                  left: 40,
                                                  right: 40,
                                                  bottom: MediaQuery.of(context)
                                                          .viewInsets
                                                          .bottom +
                                                      20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  const Text(
                                                    'How much do you want to top up?',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  TextField(
                                                    cursorColor: Colors.black,
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(),
                                                    onChanged: (val) =>
                                                        _topUpAmount = val,
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: 'Amount',
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8)),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xffFFF6D6),
                                                    ),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 26,
                                                  ),
                                                  TextButton(
                                                    onPressed: _onNext,
                                                    style: TextButton.styleFrom(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 15.0),
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFFFDA58)),
                                                    child: const Text('Next',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF000000))),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                },
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
                              );
                            },
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
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
