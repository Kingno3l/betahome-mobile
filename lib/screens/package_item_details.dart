import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';
import '../helper/url_helper.dart';
// import 'package:html/dom.dart' as dom;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class PackageItemDetails extends StatefulWidget {
  final Package package;
  final PackageItem item;
  const PackageItemDetails(
      {Key? key, required this.package, required this.item})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PackageItemDetails();
}

class _PackageItemDetails extends State<PackageItemDetails> {
  @override
  Widget build(BuildContext context) {
    final Package package = widget.package;
    final PackageItem item = widget.item;

    return Scaffold(
      appBar: ScreenBar.build(context, package.name),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage('${UrlHelper.file}/${item.getPicture()}'),
                //AssetImage(item.getPicture()),
                alignment: Alignment.center,
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('${item.getTitle()} (${item.getQuantity()})',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18)),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Color(0xffFFDA58),
                    size: 17,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '4.9',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '(145)',
                    style: TextStyle(color: Color(0xffAEAEAE)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text('Description',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   item.toString(),
              //   style: const TextStyle(height: 1.3, fontSize: 12),
              // ),
              HtmlWidget(
                item.toString(),
                textStyle: const TextStyle(fontSize: 12, height: 1.3, overflow: TextOverflow.ellipsis),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        backgroundColor: const Color(0xFFFFDA58)),
                    child: const Text(
                      'Select',
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
            ],
          )),
    );
  }
}
