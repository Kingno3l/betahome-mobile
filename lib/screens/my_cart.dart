import 'package:beta_home/models/cart_item.dart';
import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/screens/check_out.dart';
import 'package:beta_home/screens/package_item_details.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  static final List<CartItem> _cartItems = [
    CartItem(
        111, 'Dropdown fancy light', './lib/assets/imgs/remove7.png', 5300, 2),
    CartItem(112, '2-Sitter Chairs', './lib/assets/imgs/remove8.png', 25000, 1),
    CartItem(113, 'Round Table', './lib/assets/imgs/remove6.png', 11000, 3),
    CartItem(
        111, 'Dropdown fancy light', './lib/assets/imgs/remove7.png', 5300, 2),
    CartItem(112, '2-Sitter Chairs', './lib/assets/imgs/remove8.png', 25000, 1),
    CartItem(113, 'Round Table', './lib/assets/imgs/remove6.png', 11000, 3),
    CartItem(
        111, 'Dropdown fancy light', './lib/assets/imgs/remove7.png', 5300, 2),
    CartItem(112, '2-Sitter Chairs', './lib/assets/imgs/remove8.png', 25000, 1),
    CartItem(113, 'Round Table', './lib/assets/imgs/remove6.png', 11000, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBar.build(context, 'My Cart'),
      body: Padding(
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
                children: _cartItems
                    // .getItems()
                    .map((item) => Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                              color: Color(0xffF4F4F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: InkWell(
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
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image(
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.fill,
                                      image: NetworkImage(item.getImgUrl()),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.getName(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'N${item.getPrice()}',
                                              // maxLines: 4,
                                              // overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xffF55859)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                OutlinedButton(
                                                  onPressed: null,
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xff505050),
                                                    ),
                                                    shape: const CircleBorder(),
                                                    // backgroundColor:
                                                    //     const Color(0xffDADADA),
                                                  ),
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                    color: Color(0xff505050),
                                                  ),
                                                ),
                                                Text('${item.quantity()}'),
                                                OutlinedButton(
                                                  onPressed: null,
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xff505050)),
                                                    shape: const CircleBorder(),
                                                    // backgroundColor:
                                                    //     const Color(0xffDADADA),
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 15,
                                                    color: Color(0xff505050),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            OutlinedButton(
                                              onPressed: null,
                                              style: OutlinedButton.styleFrom(
                                                shape: const CircleBorder(),
                                                backgroundColor:
                                                    const Color(0xffDADADA),
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                size: 15,
                                                color: Color(0xff505050),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Total',
                      style: TextStyle(
                          color: Color(0xffFF0000),
                          fontWeight: FontWeight.w600)),
                  Text(
                    'N35,000',
                    style: TextStyle(
                        color: Color(0xffFF0000), fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  // backgroundColor: const Color(0xFFFFDA58),
                ),
                child: const Text(
                  'Continue shopping',
                  style: TextStyle(color: Color(0xffFF0000), fontSize: 12),
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
                  'Check out',
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
