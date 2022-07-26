import 'package:beta_home/models/cart_item.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/screens/package_item_details.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'Check out'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  color: Color(0xffFFF6D6),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Column(
                children: const [
                  Text(
                    'Order information',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'N150,000.00',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
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
                            borderRadius: BorderRadius.all(Radius.circular(6))),
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
                            borderRadius: BorderRadius.all(Radius.circular(6))),
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
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: const Image(
                          width: 15,
                          // height: 50,
                          // fit: BoxFit.fill,
                          image:
                              NetworkImage('./lib/assets/icons/imgs/note.png'),
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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckOut(),
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  backgroundColor: const Color(0xFFFFDA58),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
