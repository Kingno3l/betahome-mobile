class MarketItem {
  String _id;
  String _name;
  String _desc;
  String _price;
  String _picture;
  dynamic _categories;
  final bool _is_rated = false;

  MarketItem(this._id, this._name, this._desc, this._price, this._picture,
      this._categories);

  factory MarketItem.fromJson(dynamic json) {
    return MarketItem(json['_id'], json['name'], json['description'],
        json['price'], json['picture'], json['category_ids']);
  }

  get id => _id;
  get name => _name;
  get desc => _desc;
  get price => _price;
  get picture => _picture;
  get categories => _categories;
  get isRated => _is_rated;
}
