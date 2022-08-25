// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

class TransactionItem {
  static const String TYPE_CREDIT = 'credit';
  static const String TYPE_DEBIT = 'debit';

  final String _id;
  final double _amount;
  final String _type;
  final String _subType;
  final String _time;

  TransactionItem(
      this._id, this._amount, this._type, this._subType, this._time);

  factory TransactionItem.fromJson(dynamic json) {
    return TransactionItem(json['_id'], double.parse(json['amount'].toString()),
        json['type'], json['sub_type'], json['time']);
  }

  get id => _id;

  get amount => _amount;

  get type => _type;

  get subType => _subType;

  get date => DateFormat.yMMMd().format(DateTime.parse(_time));

  get time => DateFormat.jm().format(DateTime.parse(_time));
}
