import 'package:intl/intl.dart';

class OrderItem {
  final String _long_id;
  final String _short_id;
  final double _price;
  final int _is_paid;
  final String _time;
  final String _type;
  // late List<Items> _items;
  final List _items;

  OrderItem(this._long_id, this._short_id, this._price, this._is_paid,
      this._time, this._type, this._items) {
    // for (var el in items) {
    //   _items.add(Items.fromJson(el));
    // }
  }

  factory OrderItem.fromJson(dynamic json) {
    return OrderItem(
        json['_id'],
        json['id'],
        double.parse(json['total_price'].toString()),
        json['is_paid'],
        json['createdAt'],
        json['type'],
        json['items']);
  }

  get longID => _long_id;

  get id => _short_id;

  get price => _price;

  bool get isPaid => _is_paid == 1;

  get type => _type;

  get date {
    final t = DateTime.parse(_time);
    return DateFormat.yMMMd().format(t);
  }

  get time {
    final t = DateTime.parse(_time);
    return '${DateFormat.yMMMd().format(t)} ${DateFormat.jm().format(t)}';
  }

  List get items => _items;
}

// class Items {
//   final String _title;
//   final double _price;

//   Items(this._title, this._price);

//   factory Items.fromJson(dynamic json) {
//     return Items(
//       json['title'],
//       double.parse(json['price'].toString()),
//     );
//   }

//   get name => _title;

//   get price => _price;
// }
