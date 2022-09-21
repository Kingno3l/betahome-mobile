import 'package:intl/intl.dart';

class OrderItem {
  final String _id;
  final String _item_name;
  final double _price;
  final String _picture;
  final int _status;
  final String _time;

  OrderItem(this._id, this._item_name, this._price, this._picture, this._status,
      this._time);

  factory OrderItem.fromJson(dynamic json) {
    return OrderItem(
        json['_id'],
        json['item_name'],
        double.parse(json['price'].toString()),
        json['picture'],
        json['status'],
        json['time']);
  }

  get id => _id;

  get itemName => _item_name;

  get price => _price;

  get picture => _picture;

  get status => _status;

  get time {
    final t = DateTime.parse(_time);
    return '${DateFormat.yMMMd().format(t)} ${DateFormat.jm().format(t)}';
  }
}
