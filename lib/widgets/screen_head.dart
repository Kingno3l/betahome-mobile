import 'package:flutter/material.dart';

Column screenHead(title, subTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
            color: Color(0xff000000),
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        subTitle,
        style: const TextStyle(color: Color(0xff8E8E8E), fontSize: 13),
      ),
    ],
  );
}
