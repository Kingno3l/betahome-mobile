class CartItem {
  int _uid;
  String _name;
  String _imgUrl;
  double _price;
  final int _quantity;

  CartItem(this._uid, this._name, this._imgUrl, this._price, this._quantity);

  // factory MarketItem.fromJson(dynamic json) {
  //   return MarketItem(json['package_name'], json['description'], json['color'],
  //       json['price'], json['items']);
  // }

  int getUID() {
    return _uid;
  }

  String getName() {
    return _name;
  }

  String getImgUrl() {
    return _imgUrl;
  }

  double getPrice() {
    return _price;
  }

  int quantity() {
    return _quantity;
  }
}
