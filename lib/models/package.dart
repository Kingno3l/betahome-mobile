class Package {
  String name;
  String description;
  int color;
  double price;
  List items;

  Package(this.name, this.description, this.color, this.price, this.items);

  factory Package.fromJson(dynamic json) {
    return Package(json['package_name'], json['description'], json['color'],
        json['price'], json['items']);
  }

  String getName() {
    return name;
  }

  int getColor() {
    return color;
  }

  double getPrice() {
    return price;
  }

  List getItems() {
    return items;
  }

  @override
  String toString() {
    return description;
  }

  String details() {
    String str = '';
    items
        .map((e) => {
              if (str != '') {str += ', '},
              str += '(${e['quantity']}) ${e['title']}'
            })
        .toList();
    return str;
  }
}
