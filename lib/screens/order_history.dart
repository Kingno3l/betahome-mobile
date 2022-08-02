import 'package:beta_home/models/cart_item.dart';
import 'package:beta_home/models/history_item.dart';
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

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final List<HistoryItem> _transactions = [
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove4.png', 1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove8.png', -1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove4.png', 1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove8.png', -1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove4.png', 1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove8.png', -1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove4.png', 1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove8.png', -1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove4.png', 1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove8.png', -1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove4.png', 1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove8.png', -1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove4.png', 1,
        '22 May, 2022 4:01pm'),
    HistoryItem(101, 'Beta Basic', 250, './lib/assets/imgs/remove8.png', -1,
        '22 May, 2022 4:01pm'),
  ];
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
              children: _transactions
                  .mapIndexed(
                    (index, item) => Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      color: const Color(0xffF4F4F4),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(item.picture()),
                            // alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.packageName(),
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'N${item.price()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                item.status() == 1
                                    ? Icons.check_circle_sharp
                                    : Icons.cancel,
                                color: Color(item.status() == 1
                                    ? 0xff4BD37B
                                    : 0xffFF0000),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                item.time(),
                                style: const TextStyle(
                                  color: Color(0xff696969),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
