class TransactionItem {
  final int _uid;
  final double _amount;
  final String _type;
  final String _subType;
  final String _date;
  final String _time;

  TransactionItem(this._uid, this._amount, this._type, this._subType,
      this._date, this._time);

  // factory MarketItem.fromJson(dynamic json) {
  //   return MarketItem(json['package_name'], json['description'], json['color'],
  //       json['price'], json['items']);
  // }

  int uid() {
    return _uid;
  }

  double amount() {
    return _amount;
  }

  String type() {
    return _type;
  }

  String subType() {
    return _subType;
  }

  String date() {
    return _date;
  }

  String time() {
    return _time;
  }
}
