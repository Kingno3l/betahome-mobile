import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:beta_home/screens/payment.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatefulWidget {
  final Package package;
  const PaymentOption({Key? key, required this.package}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentOptionState();
}

Widget RadioButton(
    {int fillColor = 0xffffffff,
    int activeColor = 0xffFFDA58,
    selected = false}) {
  return Container(
    width: 16,
    height: 16,
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
        color: Color(fillColor),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff8E8E8E), width: 0.8)),
    child: Container(
      decoration: BoxDecoration(
          color: Color(selected ? activeColor : 0x00000000),
          borderRadius: BorderRadius.circular(8)),
    ),
  );
}

class _PaymentOptionState extends State<PaymentOption> {
  String _paymentPlan = '';

  @override
  Widget build(BuildContext context) {
    final Package package = widget.package;

    return Scaffold(
      appBar: ScreenBar.build(context, 'Payment option'),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              const Text('Payment plan',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 20,
              ),
              _paymentPlan == 'Installment'
                  ? Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F2F2),
                          borderRadius: BorderRadius.circular(6)),
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
                      ))
                  : const SizedBox(
                      height: 0,
                    ),
              Container(
                padding: const EdgeInsets.only(
                    left: 12, top: 20, right: 12, bottom: 20),
                decoration: BoxDecoration(
                    color: Color(
                        _paymentPlan == 'Outright' ? 0xff73D282 : 0xffFFF6D6),
                    borderRadius: BorderRadius.circular(6)),
                child: InkWell(
                  onTap: () => {
                    setState(() {
                      _paymentPlan = 'Outright';
                    })
                  },
                  child: Row(
                    children: [
                      RadioButton(selected: _paymentPlan == 'Outright'),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Text(
                        'Outright',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(_paymentPlan == 'Outright'
                                ? 0xffffffff
                                : 0xff000000)),
                      )),
                      Text('N150,000.00',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(_paymentPlan == 'Outright'
                                  ? 0xffffffff
                                  : 0xff000000))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 12, top: 20, right: 12, bottom: 20),
                decoration: BoxDecoration(
                    color: Color(_paymentPlan == 'Installment'
                        ? 0xff73D282
                        : 0xffFFF6D6),
                    borderRadius: BorderRadius.circular(6)),
                child: InkWell(
                  onTap: () => {
                    setState(() {
                      _paymentPlan = 'Installment';
                    })
                  },
                  child: Row(
                    children: [
                      RadioButton(selected: _paymentPlan == 'Installment'),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Text(
                        'Installment',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(_paymentPlan == 'Installment'
                                ? 0xffffffff
                                : 0xff000000)),
                      )),
                      Text('Select your payment plan',
                          style: TextStyle(
                              fontSize: 11,
                              color: Color(_paymentPlan == 'Installment'
                                  ? 0xffffffff
                                  : 0xff000000))),
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: _paymentPlan == 'Installment' ? 30 : 70, bottom: 30),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Payment(
                                  amount: 1,
                                )),
                      );
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        backgroundColor: const Color(0xFFFFDA58)),
                    child: const Text(
                      'Proceed',
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
            ],
          )),
    );
  }
}
