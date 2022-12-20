import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/models/listing_item.dart';
import 'package:beta_home/screens/dashboard.dart';
import 'package:beta_home/screens/sign_in.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool _isProgress = false;

  Future onPay() async {
    try {
      setState(() {
        _isProgress = true;
      });
      List<ListingItem> cartItems = Provider.of<DataModel>(
        context,
        listen: false,
      ).cartItems;
      double total = Provider.of<DataModel>(
        context,
        listen: false,
      ).cartTotal;

      List items = [];
      for (var el in cartItems) {
        items.add(el.toJson());
      }
      final resp = await ServerHelper.post(
        UrlHelper.checkoutPay,
        {'items': items, 'total_price': total},
      );
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Utils.showToast(json.msg);
        if (json.status == 'success') {
          if (!mounted) return;
          Provider.of<DataModel>(
            context,
            listen: false,
          ).clearCart();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
        }
      } else {
        Utils.showToast('Connection error.');
      }
    } catch (e) {
      Utils.showToast('An error occured.');
    }
    setState(() {
      _isProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Check out'),
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
                      'Order information',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'N${data.cartTotal}',
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
              const Text(
                'Delivery location',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PackageItemDetails(
                  //       package: package,
                  //       item: PackageItem.fromJson(item),
                  //     ),
                  //   ),
                  // ),
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color(0xffF4F4F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Center(
                            child: Image.asset(
                              './lib/assets/icons/imgs/marker.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '6 Ayopo Adebonyan street, Akasoleri Ogba, Lagos.',
                                maxLines: 4,
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Payment method',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PackageItemDetails(
                  //       package: package,
                  //       item: PackageItem.fromJson(item),
                  //     ),
                  //   ),
                  // ),
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color(0xffF4F4F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: const Center(
                            child: Image(
                              // width: 15,
                              // height: 50,
                              // fit: BoxFit.fill,
                              image: AssetImage(
                                  './lib/assets/icons/imgs/mastercard.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Mastercard',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '2565 **** **** 2555',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Transaction ID',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PackageItemDetails(
                  //       package: package,
                  //       item: PackageItem.fromJson(item),
                  //     ),
                  //   ),
                  // ),
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color(0xffF4F4F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: const Image(
                            width: 15,
                            // height: 50,
                            // fit: BoxFit.fill,
                            image:
                                AssetImage('./lib/assets/icons/imgs/note.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '1393083828540JC',
                                maxLines: 4,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_right),
                      ],
                    ),
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
