import 'dart:html';

import 'package:beta_home/models/cart_item.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/models/transaction_item.dart';
import 'package:beta_home/screens/check_out.dart';
import 'package:beta_home/screens/package_item_details.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/screens/transactions.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
  ];
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${item.subType()} ${item.type()}',
                              style: const TextStyle(color: Color(0xff696969)),
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
                              style: const TextStyle(color: Color(0xff696969)),
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
    );
  }
}
