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
        width: 50,
        height: 80,
      ),
      Positioned(
        top: 12,
        left: 12,
        right: 12,
        bottom: 12,
        child: Consumer<DataModel>(builder: (context, data, child) {
          return data.profile != null && data.profile!.profile_pic != null
              ? CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      NetworkImage(data.profile?.profile_pic ?? 'http://'),
                )
              : const CircleAvatar(
                  backgroundImage: AssetImage('./lib/assets/imgs/dp.jpg'),
                );
        }),
      ),
    ],
  );
}
