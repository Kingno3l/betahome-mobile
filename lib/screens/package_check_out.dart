import 'package:beta_home/helper/payment_helper.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/screens/dashboard.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/widgets/installment_info.dart';
import 'package:beta_home/widgets/pay_instal_freq.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackageCheckout extends StatefulWidget {
  final Package package;
  final Map<String, dynamic> paymentPlan;

  const PackageCheckout(
      {Key? key, required this.package, required this.paymentPlan})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PackageCheckoutState();
}

class _PackageCheckoutState extends State<PackageCheckout> {
  bool _isProgress = false;

  Future onPay() async {
    try {
      setState(() {
        _isProgress = true;
      });
      // List<ListingItem> cartItems = Provider.of<DataModel>(
      //   context,
      //   listen: false,
      // ).cartItems;
      // double total = Provider.of<DataModel>(
      //   context,
      //   listen: false,
      // ).cartTotal;

      // List items = [];
      // for (var el in cartItems) {
      //   items.add(el.toJson());
      // }
      final resp = await ServerHelper.post(
        '${UrlHelper.checkoutPay}/package',
        {
          'package': {'id': widget.package.id, 'price': widget.package.price},
          'plan': widget.paymentPlan
        },
      );
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(json.msg),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
                        ),
                    child: const Text('OK'))
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text(json.msg),
            ),
          );
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      print(e);
      Utils.showToast('An error occured.');
    }
    setState(() {
      _isProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Package package = widget.package;
    Map<String, dynamic> plan = widget.paymentPlan;

    return Scaffold(
      appBar: ScreenBar.build(context, 'Checkout'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Consumer<DataModel>(builder: (context, data, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Color(0xffFFF6D6),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Total Package',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'N${package.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F2F2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Text(
                  '${package.name} Information',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...package.getItems().map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${item['title']}',
                          ),
                          Text(
                            '${item['quantity']}',
                          ),
                        ],
                      ),
                    ),
                  ),
              const Divider(
                color: Color(0xFFFFDA58),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: plan['interval'] != 0,
                child: InstallmentInfo(),
              ),
              Visibility(
                visible: plan['interval'] != 0,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F2F2),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${plan['tag']} payment plan',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          PayInstalFreq(plan, false),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              '80% upfront payment',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'N${PaymentHelper(package.price).eightyPer}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),
                                ),
                              ),
                              const Text(
                                'within 60 days',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextButton(
                  onPressed: _isProgress
                      ? null
                      : () => data.profile == null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignIn(),
                              ),
                            )
                          : onPay(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color(0xFFFFDA58),
                  ),
                  child: Text(
                    _isProgress ? 'Processing...' : 'Pay (Wallet)',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
