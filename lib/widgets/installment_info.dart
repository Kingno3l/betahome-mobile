import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container InstallmentInfo() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: const Color(0xffF5F2F2), borderRadius: BorderRadius.circular(6)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'NOTE',
          style: TextStyle(
              color: Color(0xffFF0000),
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '80% of the installment payment plan must have been made, on or before 60 days you subscribe to purchase the product, then 20% balance of payment within 30 days of post product delivery date.',
          style: TextStyle(fontSize: 12, height: 1.4),
        ),
      ],
    ),
  );
}
