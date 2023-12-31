import 'package:beta_home/models/package.dart';
import 'package:beta_home/screens/package_details.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class BetaHome extends StatelessWidget {
  final List items;

  const BetaHome({Key? key, required this.items}) : super(key: key);

  void onPackageClick(context, item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PackageDetails(
          package: Package.fromJson(item),
        ),
      ),
    );
  }

  Widget packageTitle(title, color, isShow, onPress) {
    if (!isShow) return const SizedBox(width: 0);

    return Flexible(
      flex: 1,
      child: Container(
        color: Color(int.parse(color)),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: InkWell(
            onTap: onPress,
            child: Center(
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            )),
      ),
    );
  }

  IntrinsicHeight itemRow(context, index, package) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          packageTitle(
            package['name'],
            package['color'],
            index % 2 == 0,
            () => onPackageClick(context, package),
          ),
          ...package['items'].map(
            (item) => Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(
                    width: index % 2 == 0 ? 5 : 0,
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () => onPackageClick(context, package),
                      child: Image(
                        width: double.infinity,
                        image: AssetImage(item['picture']),
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: index % 2 != 0 ? 5 : 0,
                  ),
                  SizedBox(
                    width: index % 2 != 0 ? 5 : 0,
                  ),
                ],
              ),
            ),
          ),
          packageTitle(
            package['name'],
            package['color'],
            index % 2 != 0,
            () => onPackageClick(context, package),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      children: items
          .mapIndexed((index, item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: itemRow(context, index, item),
              ))
          .toList(),
    );
  }
}
