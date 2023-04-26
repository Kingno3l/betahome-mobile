import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TandC extends StatefulWidget {
  const TandC({
    super.key,
  });

  @override
  State<TandC> createState() => _TandCState();
}

class _TandCState extends State<TandC> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("lib/assets/svgs/t_and_c.svg"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Terms of Service",
                style: TextStyle(
                    color: Color(0xff273357), fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Update 30/01/2023",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ],
          ),
          Container()
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "1. ",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
              ),
              Text("Terms and Conditions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
            ],
          ),
          Text(
            "BOdy",
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
          ),
          Row(
            children: [
              Text(
                "2. ",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
              ),
              Text("Privacy Policy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
            ],
          ),
          Text(
            "BOdy",
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                side: BorderSide(color: Colors.grey.shade400)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Decline",
                style: TextStyle(color: Colors.grey.shade500),
              ),
            )),
        TextButton(
            onPressed: () {
              // (bool? val) {
              //   setState(() {
              //     _isTandC = val!;
              //   });
              // };
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFfdd958),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Accept",
                style: TextStyle(color: Colors.black),
              ),
            ))
      ],
    );
  }
}

