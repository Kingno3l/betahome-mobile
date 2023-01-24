import 'package:beta_home/models/data.dart';
import 'package:beta_home/screens/check_out.dart';
import 'package:beta_home/widgets/ordered_item.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'My Cart'),
      body: Consumer<DataModel>(builder: (context, data, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Items',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: ListView(
                  // padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: data.cartItems
                      .map(
                        (item) => OrderedItem(item, () {
                          Provider.of<DataModel>(context, listen: false)
                              .removeFromCart(item);
                        }),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        color: Color(0xffFF0000),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'N${data.cartTotal}',
                      style: const TextStyle(
                        color: Color(0xffFF0000),
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              // Center(
              //   child: TextButton(
              //     onPressed: () {},
              //     style: TextButton.styleFrom(
              //       padding: const EdgeInsets.symmetric(vertical: 24),
              //       // backgroundColor: const Color(0xFFFFDA58),
              //     ),
              //     child: const Text(
              //       'Continue shopping',
              //       style: TextStyle(
              //         color: Color(0xffFF0000),
              //         fontSize: 12,
              //       ),
              //     ),
              //   ),
              // ),
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
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color(0xFFFFDA58),
                  ),
                  child: const Text(
                    'Check out',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
