import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/screens/package_item_details.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

class PackageDetails extends StatefulWidget {
  final Package package;
  const PackageDetails({Key? key, required this.package}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PackageDetails();
}

class _PackageDetails extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    final Package package = widget.package;

    return Scaffold(
      appBar: ScreenBar.build(context, package.getName()),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text.rich(TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        height: 1.3),
                    children: [
                      TextSpan(
                          text: package.toString(),
                          style: const TextStyle(color: Color(0xff333333))),
                      TextSpan(
                          text: ': ${package.details()}',
                          style: const TextStyle(color: Color(0xffB18B04))),
                    ]))
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: package
                .getItems()
                .map((item) => Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          color: Color(package.getColor()),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PackageItemDetails(
                                        package: package,
                                        item: PackageItem.fromJson(item),
                                      )))
                        },
                        child: IntrinsicHeight(
                            child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image(
                                width: 90,
                                height: 90,
                                fit: BoxFit.fill,
                                image: AssetImage(item['picture']),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      item['description'],
                                      maxLines: 4,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(fontSize: 12),
                                    )
                                  ],
                                )),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    '${item['quantity']}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                      ),
                    ))
                .toList(),
          )),
          PhysicalModel(
              // color: Colors.white,
              color: const Color(0xffFFDA58),
              // shadowColor: const Color(0xffFFDA58),
              elevation: 8,
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentOption(package: package))),
                child: Container(
                  // color: const Color(0xffFFDA58),
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'Complete your furniture selection?',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'N${package.getPrice()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      const Text(
                        'Order now',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
