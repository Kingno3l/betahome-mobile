import 'package:flutter/material.dart';


class bank extends StatelessWidget {
  var name;
  var code;
  bank({
    super.key,
    required this.name,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, [name, code]);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
            color: Color(0xffFFF6D6), borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(name),
          ],
        ),
      ),
    );
  }
}