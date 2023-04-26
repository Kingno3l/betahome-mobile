import 'package:flutter/material.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total Amount Paid:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Total Remaining:',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'N50,000',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff51a812)),
              ),
              Text(
                'N100,000',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffed462f)),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFFE4E4E4)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.white,
                minHeight: 25,
                color: Color(0xffd3fadb),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Text(
                "Next installment on Feb28, 2023: ",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "N10,000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
