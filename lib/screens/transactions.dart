import 'dart:html';

import 'package:beta_home/models/cart_item.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/models/transaction_item.dart';
import 'package:beta_home/screens/check_out.dart';
import 'package:beta_home/screens/package_item_details.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<TransactionItem> _transactions = [
    TransactionItem(100, 2400, 'credit', 'other', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'wallet', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 2000, 'debit', 'wallet', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 500, 'debit', 'other', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 2400, 'credit', 'wallet', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'other', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 10, 'debit', 'wallet', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'wallet', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 2400, 'credit', 'other', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'wallet', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 2400, 'credit', 'other', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'wallet', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 2000, 'debit', 'wallet', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 500, 'debit', 'other', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 2400, 'credit', 'wallet', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'other', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 10, 'debit', 'wallet', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'wallet', '22 May, 2022', '4:01pm'),
    TransactionItem(100, 2400, 'credit', 'other', '23 May, 2022', '4:30pm'),
    TransactionItem(101, 250, 'credit', 'wallet', '22 May, 2022', '4:01pm'),
  ];
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
                        padding: const EdgeInsets.all(20),
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
                        padding: const EdgeInsets.all(20),
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
              ..._transactions
                  .mapIndexed(
                    (index, item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: item.type() == 'debit'
                                    ? const Color.fromARGB(50, 235, 87, 87)
                                    : const Color.fromARGB(50, 20, 176, 139),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: SvgPicture.asset(
                              item.subType() == 'wallet'
                                  ? './lib/assets/icons/svgs/wallet_top_up.svg'
                                  : './lib/assets/icons/svgs/cd.svg',
                              color: item.type() == 'debit'
                                  ? const Color.fromRGBO(235, 87, 87, 1)
                                  : const Color.fromRGBO(20, 176, 139, 1),
                            ),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'N${item.amount()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${item.subType()} ${item.type()}',
                                style:
                                    const TextStyle(color: Color(0xff696969)),
                              ),
                            ],
                          )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(item.date()),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                item.time(),
                                style:
                                    const TextStyle(color: Color(0xff696969)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList()
            ],
          )),
        ],
      ),
    );
  }
}
