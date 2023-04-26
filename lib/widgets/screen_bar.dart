import 'package:flutter/material.dart';

class ScreenBar {
  static PreferredSizeWidget build(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      titleTextStyle: const TextStyle(color: Color(0xff000000)),
    );
  }
}
