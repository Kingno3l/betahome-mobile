// class Package {
//   String _name;
//   String _description;
//   String _color;
//   String _price;
//   List _items;

//   Package(this._name, this._description, this._color, this._price, this._items);

//   factory Package.fromJson(dynamic json) {
//     return Package(json['name'], json['description'], json['color'],
//         json['price'], json['items']);
//   }

//   String getName() {
//     return _name;
//   }

//   int getColor() {
//     return int.parse(_color);
//   }

//   double getPrice() {
//     return double.parse(_price);
//   }

//   List getItems() {
//     return _items;
//   }

//   @override
//   String toString() {
//     return _description;
//   }

//   String details() {
//     String str = '';
//     _items
//         .map((e) => {
//               if (str != '') {str += ', '},
//               str += '(${e['quantity']}) ${e['title']}'
//             })
//         .toList();
//     return str;
//   }
// }

class Package {
  String _id;
  String _name;
  String _description;
  // String _color;
  int _price;
  List<dynamic> _items;

  Package(this._id, this._name, this._description, 
  // this._color,
   this._price,
      this._items);

  factory Package.fromJson(dynamic json) {
    return Package(json['_id'], json['name'], json['desc'],
        // json['color'],
         json['price'], json['items']);
  }

  get id => _id;

  get name => _name;

  // get color => int.parse(_color);

  get price => _price.toDouble() ;

  List getItems() {
    return _items;
  }

  @override
  String toString() {
    return _description;
  }

  String details() {
    String str = '';
    _items
        .map((e) => {
              if (str != '') {str += ', '},
              str += '(${e['quantity']}) ${e['title']}'
            })
        .toList();
    return str;
  }
}
