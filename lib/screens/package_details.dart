import 'package:beta_home/models/package.dart';
import 'package:beta_home/models/package_item.dart';
import 'package:beta_home/screens/package_item_details.dart';
import 'package:beta_home/screens/payment_option.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:html/parser.dart' as htmlparser;
// import 'package:html/dom.dart' as dom;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';


import '../helper/url_helper.dart';

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
      appBar: ScreenBar.build(context, package.name),
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
                // Text.rich(
                //   TextSpan(
                //     style: const TextStyle(
                //         fontWeight: FontWeight.normal,
                //         fontSize: 12,
                //         height: 1.3),
                //     children: [
                //       TextSpan(
                //         text: package.toString(),
                //         style: const TextStyle(color: Color(0xff333333)),
                //       ),
                //       TextSpan(
                //         text: ': ${package.details()}',
                //         style: const TextStyle(color: Color(0xffB18B04)),
                //       ),
                //     ],
                //   ),
                // ),
                HtmlWidget(package.toString()),
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
                          color: Color(0xffd3fadb),
                          // Color(package.color),
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
                                image: NetworkImage(
                                    '${UrlHelper.file}/${item['cover_pic']}'),
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
                                  // Text(
                                  //   item['name'],
                                  //   style: const TextStyle(
                                  //       fontWeight: FontWeight.w600),
                                  // ),
                                  HtmlWidget(item['name']),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  // Text(
                                  //   item['desc'],
                                  //   maxLines: 4,
                                  //   overflow: TextOverflow.fade,
                                  //   style: const TextStyle(fontSize: 12),
                                  // ),
                                  HtmlWidget(
                                    item['desc'],
                                    // .substring(0, 20),
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                //  MyHtml(item['desc'], maxLines: 2,)
                                ],
                              ),
                            ),
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
                      'N${package.price}',
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
            ),
          )
        ],
      ),
    );
  }
}
// class MyHtml extends HtmlWidget {
//   const MyHtml(super.html, {this.maxLines,});
//   final int? maxLines;
//   @override
//    void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('maxLines', maxLines, defaultValue: null));
//   }
//   // Widget build(BuildContext context) {
//   //   return const Placeholder();
//   // }
// }
//  body: new Center(
//             child: SingleChildScrollView(
//               child: Html(
//                 data: """
//                 <div>Follow<a class='sup'><sup>pl</sup></a> 
//                   Below hr
//                     <b>Bold</b>
//                 <h1>what was sent down to you from your Lord</h1>, 
//                 and do not follow other guardians apart from Him. Little do 
//                 <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
//                 """,
//                 padding: EdgeInsets.all(8.0),
//                 onLinkTap: (url) {
//                   print("Opening $url...");
//                 },
//                 customRender: (node, children) {
//                   if (node is dom.Element) {
//                     switch (node.localName) {
//                       case "custom_tag": // using this, you can handle custom tags in your HTML 
//                         return Column(children: children);
//                     }
//                   }
//                 },
//               ),
//             ),
//           )