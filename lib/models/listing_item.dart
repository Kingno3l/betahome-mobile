import 'package:beta_home/helper/url_helper.dart';

class ListingItem {
  String _id;
  String _title;
  String _desc;
  double _price;
  String? _picture;
  // dynamic _categories;
  final bool _isRated = false;

  ListingItem(this._id, this._title, this._desc, this._price, this._picture
      // , this._categories
      );

  factory ListingItem.fromJson(dynamic json) {
    return ListingItem(
      json['_id'],
      json['title'],
      json['desc'],
      double.parse(json['price'].toString()),
      json['picture'],
      // json['category_ids']
    );
  }

  get id => _id;
  get name => _title;
  get desc => _desc;
  get price => _price;
  get picture => '${UrlHelper.image}?key=$_picture';
  // get categories => _categories;
  get isRated => _isRated;
}
