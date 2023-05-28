import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/listing_item.dart';
import 'package:beta_home/screens/my_cart.dart';
import 'package:beta_home/widgets/dot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListingItemDetails extends StatefulWidget {
  final ListingItem item;

  const ListingItemDetails({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListingItemDetailsState();
}

class _ListingItemDetailsState extends State<ListingItemDetails> {
  @override
  Widget build(BuildContext context) {
    final ListingItem item = widget.item;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyCart(),
                      ),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color(0xff000000),
                    ),
                  ),
                  Consumer<DataModel>(
                    builder: (context, data, child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 9, top: 9),
                        child: data.cartItems.isEmpty ? null : Dot(),
                      );
                    },
                  ),
                ],
              ),
            ],
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${item.picture.toString()}'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(item.isRated ? 0xffFFDA58 : 0xffD9D9D9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.thumb_up,
                      color: Color(0xff2F2E41),
                      size: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                item.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFDA58),
                      // color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '4.9',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '(145)',
                    style: TextStyle(color: Color(0xffAEAEAE)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'N${item.price}',
                style: const TextStyle(
                    color: Color(0xffF55859),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item.desc,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Consumer<DataModel>(builder: (context, data, child) {
                  return TextButton(
                    onPressed: () => data.cartItems.contains(item)
                        ? Provider.of<DataModel>(context, listen: false)
                            .removeFromCart(item)
                        : Provider.of<DataModel>(context, listen: false)
                            .addToCart(item),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: const Color(0xFFFFDA58)),
                    child: Text(
                      data.cartItems.contains(item)
                          ? 'Remove from Cart'
                          : 'Add to Cart',
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }),
              ),
            ],
          )),
    );
  }
}
