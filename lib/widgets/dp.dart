import 'package:flutter/material.dart';

Stack dp() {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(width: 6, color: const Color(0xffFFDA58)),
            borderRadius: BorderRadius.circular(55)),
        width: 110,
        height: 110,
      ),
      Container(
        color: Colors.white,
        width: 60,
        height: 90,
      ),
      const CircleAvatar(
        radius: 55,
        // foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        child: Image(
          image: NetworkImage('./lib/assets/imgs/dp.png'),
          height: 86,
          width: 86,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}
