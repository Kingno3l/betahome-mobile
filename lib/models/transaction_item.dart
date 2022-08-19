class TransactionItem {
  final String _id;
  final double _amount;
  final String _type;
  final String _subType;
  final String _date;
  final String _time;

  TransactionItem(this._id, this._amount, this._type, this._subType, this._date,
      this._time);

  factory TransactionItem.fromJson(dynamic json) {
    return TransactionItem(json['_id'], double.parse(json['amount'].toString()),
        json['type'], json['sub_type'], json['date'], json['time']);
  }

  get id => _id;

  get amount => _amount;

  get type => _type;

  get subType => _subType;

  get date => _date;

  get time => _time;
}
