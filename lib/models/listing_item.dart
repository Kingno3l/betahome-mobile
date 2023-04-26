import 'package:beta_home/helper/url_helper.dart';

class ListingItem {
  String _id;
  String _title;
  String? _desc;
  double _price;
  String? _picture;
  int _cartQty = 1;
  // dynamic _categories;
  final bool _isRated = false;

  ListingItem(this._id, this._title, this._desc, this._price, this._picture
      // , this._categories
      );

  factory ListingItem.fromJson(dynamic json) {
    return ListingItem(
      json['_id'],
      json['name'],
      json['desc'],
      double.parse(json['price'].toString()),
      json['cover_pic'],
      // json['category_ids']
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': _id, 'price': _price};
  }

  set cartQty(val) {
    _cartQty = val;
  }

  get id => _id;

  get name => _title;

  get desc => _desc;

  get price => _price;

  get picture =>
      _picture != null ? '${UrlHelper.file}/${_picture!}' : _picture;
  // get picture => _picture;

  get cartQty => _cartQty;

  // get categories => _categories;

  get isRated => _isRated;
}
