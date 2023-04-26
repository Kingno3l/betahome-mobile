import 'package:beta_home/widgets/payment_card.dart';
import 'package:beta_home/widgets/progress_bar.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstallmentalPaymentScreen extends StatefulWidget {
  const InstallmentalPaymentScreen({super.key});

  @override
  State<InstallmentalPaymentScreen> createState() => _InstallmentalPaymentScreenState();
}

class _InstallmentalPaymentScreenState extends State<InstallmentalPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: ScreenBar.build(context, 'Installmental Payment'),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    color: const Color(0xffd3fadb),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(children: const [
                      Text(
                        'Beta Basic',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'N150,000.00',
                        style:
                            TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const ProgressBar(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Monthly Installmental Payment",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),),
                      child: ListView(
                                    children: [
                      PaymentCard(
                        date: "Feb 28 2023",
                        installmentNo: 6,
                        status: "Due",
                      ),
                      PaymentCard(
                        date: "Jan 28 2023",
                        installmentNo: 6,
                        status: "Missed",
                      ),
                      PaymentCard(
                        date: "Dec 28 2022",
                        installmentNo: 6,
                        status: "Paid",
                      ),
                      PaymentCard(
                        date: "Nov 28 2022",
                        installmentNo: 6,
                        status: "Paid",
                      ),
                      PaymentCard(
                        date: "Oct 28 2022",
                        installmentNo: 6,
                        status: "Paid",
                      ),
                      PaymentCard(
                        date: "Sep 28 2022",
                        installmentNo: 6,
                        status: "Missed",
                      ),
                                    ],
                                  ),
                    )),
              ],
            ),
          )),
    );
  }
}
