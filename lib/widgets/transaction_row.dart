import 'package:beta_home/models/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Padding transactionRow(TransactionItem item) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Container(
          width: 45,
          height: 45,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: item.type == 'debit'
                ? const Color.fromARGB(50, 235, 87, 87)
                : const Color.fromARGB(50, 20, 176, 139),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: SvgPicture.asset(
            item.subType == 'wallet'
                ? './lib/assets/icons/svgs/wallet_top_up.svg'
                : './lib/assets/icons/svgs/cd.svg',
            color: item.type == 'debit'
                ? const Color.fromRGBO(235, 87, 87, 1)
                : const Color.fromRGBO(20, 176, 139, 1),
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'N${item.amount}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${item.subType} ${item.type}',
              style: const TextStyle(color: Color(0xff696969)),
            ),
          ],
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${item.date}'),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${item.time}',
              style: const TextStyle(color: Color(0xff696969)),
            ),
          ],
        )
      ],
    ),
  );
}
