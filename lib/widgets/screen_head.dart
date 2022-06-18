import 'package:flutter/material.dart';

Column screenHead(title, subTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
            color: Color(0xff000000),
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      Text(
        subTitle,
        style: const TextStyle(color: Color(0xff8E8E8E), fontSize: 12),
      ),
    ],
  );
}
