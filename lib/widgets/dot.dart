import 'package:flutter/material.dart';

Container Dot() {
  return Container(
    width: 6,
    height: 6,
    margin: const EdgeInsets.only(left: 15, top: 2),
    decoration: const BoxDecoration(
        color: Color(0xffFF0000),
        borderRadius: BorderRadius.all(Radius.circular(3))),
  );
}
