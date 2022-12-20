import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/helper/payment_helper.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/screens/package_check_out.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
import 'package:beta_home/widgets/installment_info.dart';
import 'package:beta_home/widgets/pay_instal_freq.dart';
import 'package:beta_home/widgets/screen_bar.dart';
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
  // String _paymentPlan = '';
  Map<String, dynamic> _selectedPlan = {'tag': ''};

  @override
  Widget build(BuildContext context) {
    final Package package = widget.package;
    PaymentHelper payment = PaymentHelper(package.price);
    final outright = {
      'tag': 'Outright',
      'interval': 0,
      'for': 'outright',
      'amount': payment.outright,
    };
    final List installments = [
      {
        'tag': 'Daily',
        'interval': 1,
        'for': 'daily for 90 days',
        'amount': payment.installment(1),
      },
      {
        'tag': 'Weekly',
        'interval': 7,
        'for': 'weekly for 12 weeks',
        'amount': payment.installment(7),
      },
      {
        'tag': 'Monthly',
        'interval': 30,
        'for': 'monthly for 3 months',
        'amount': payment.installment(30),
      },
    ];
    bool isInstall =
        _selectedPlan['tag'] != '' && _selectedPlan['tag'] != outright['tag'];

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
              _selectedPlan['tag'] != '' &&
                      _selectedPlan['tag'] != outright['tag']
                  ? InstallmentInfo()
                  : const SizedBox(
                      height: 0,
                    ),
              Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 15,
                  right: 12,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                    color: Color(
                      _selectedPlan['tag'] == outright['tag']
                          ? 0xff73D282
                          : 0xffFFF6D6,
                    ),
                    borderRadius: BorderRadius.circular(6)),
                child: InkWell(
                  onTap: () => {
                    setState(() {
                      _selectedPlan = outright;
                    })
                  },
                  child: Row(
                    children: [
                      RadioButton(
                          selected: _selectedPlan['tag'] == outright['tag']),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Text(
                        'Outright',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(
                            _selectedPlan['tag'] == outright['tag']
                                ? 0xffffffff
                                : 0xff000000,
                          ),
                        ),
                      )),
                      Text(
                        'N${package.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(
                            _selectedPlan['tag'] == outright['tag']
                                ? 0xffffffff
                                : 0xff000000,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 15,
                  right: 12,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                    color: Color(_selectedPlan['tag'] != '' &&
                            _selectedPlan['tag'] != outright['tag']
                        ? 0xff73D282
                        : 0xffFFF6D6),
                    borderRadius: BorderRadius.circular(6)),
                child: InkWell(
                  onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: BotomSheet.shape(),
                      context: context,
                      builder: (context) => BotomShet.installmentOptions(
                              installments, _selectedPlan, (plan) {
                            Navigator.pop(context);
                            setState(() {
                              _selectedPlan = plan;
                            });
                          })),
                  child: Row(
                    children: [
                      RadioButton(
                          selected: _selectedPlan['tag'] != '' &&
                              _selectedPlan['tag'] != outright['tag']),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          'Installment',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(_selectedPlan['tag'] != '' &&
                                    _selectedPlan['tag'] != outright['tag']
                                ? 0xffffffff
                                : 0xff000000),
                          ),
                        ),
                      ),
                      _selectedPlan['tag'] != '' &&
                              _selectedPlan['tag'] != outright['tag']
                          ? PayInstalFreq(_selectedPlan, isInstall)
                          : Text(
                              'Select your payment plan',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(
                                  _selectedPlan['tag'] != '' &&
                                          _selectedPlan['tag'] !=
                                              outright['tag']
                                      ? 0xffffffff
                                      : 0xff000000,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: _selectedPlan['tag'] != '' &&
                            _selectedPlan['tag'] != outright['tag']
                        ? 30
                        : 70,
                    bottom: 30,
                  ),
                  child: TextButton(
                    onPressed: _selectedPlan['tag'] == ''
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PackageCheckout(
                                  package: package,
                                  paymentPlan: _selectedPlan,
                                ),
                              ),
                            );
                          },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
