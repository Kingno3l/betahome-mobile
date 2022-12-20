import 'package:flutter/material.dart';

Column PayInstalFreq(Map value, bool isSelect) {
  return Column(
    children: [
      Text(
        'N${value['amount']}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(isSelect ? 0xffffffff : 0xff000000),
        ),
      ),
      Text(
        '${value['for']}',
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    ],
  );
}
