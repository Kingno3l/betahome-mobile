import 'package:flutter/material.dart';


class PaymentCard extends StatelessWidget {
  final String date;
  final int installmentNo;
  final String status;
  PaymentCard({
    required this.date,
    required this.installmentNo,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
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
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Monthly Installment ($installmentNo of 15)",
                style: const TextStyle(
                  fontSize: 13,
                  // fontWeight: FontWeight.w600,
                ),
              ),
              status == "Missed"
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13, vertical: 3
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFED462F),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text(
                        "Not completed",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 13,vertical: 3
                ),
                decoration: BoxDecoration(
                    color: status == "Due"
                        ? Color(0xFFFDD958)
                        : status == "Paid"
                            ? Color(0xFF64CD16)
                            : status == "Missed"
                                ? Color(0xFFED462F)
                                : null,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  status == "Due"
                      ? "Due"
                      : status == "Paid"
                          ? "Paid"
                          : status == "Missed"
                              ? "Missed"
                              : "",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: status == "Due"
                        ? Colors.black
                        : status == "Paid"
                            ? Colors.black
                            : status == "Missed"
                                ? Colors.white
                                : null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          const Divider(color: Color(0xFFE6E6E6), thickness: 2,),
        ],
      ),
    );
  }
}
