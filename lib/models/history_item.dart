class HistoryItem {
  final int _uid;
  final String _packageName;
  final double _price;
  final String _picture;
  final int _status;
  final String _time;

  HistoryItem(this._uid, this._packageName, this._price, this._picture,
      this._status, this._time);

  // factory MarketItem.fromJson(dynamic json) {
  //   return MarketItem(json['package_name'], json['description'], json['color'],
  //       json['price'], json['items']);
  // }

  int uid() {
    return _uid;
  }

  String packageName() {
    return _packageName;
  }

  double price() {
    return _price;
  }

  String picture() {
    return _picture;
  }

  int status() {
    return _status;
  }

  String time() {
    return _time;
  }
}
