import 'package:beta_home/models/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      Consumer<DataModel>(builder: (context, data, child) {
        return CircleAvatar(
          radius: 55,
          // foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          child: data.profile!.profile_pic == null
              ? const Image(
                  image: AssetImage('./lib/assets/imgs/dp.jpg'),
                  height: 86,
                  width: 86,
                  fit: BoxFit.cover,
                )
              : const Image(
                  image: NetworkImage('./lib/assets/imgs/dp.png'),
                  height: 86,
                  width: 86,
                  fit: BoxFit.cover,
                ),
        );
      }),
    ],
  );
}
