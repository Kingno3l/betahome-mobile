class PackageItem {
  String uid;
  String title;
  String description;
  int quantity;
  String picture;

  PackageItem(
      this.uid, this.title, this.description, this.quantity, this.picture);

  factory PackageItem.fromJson(dynamic json) {
    return PackageItem(json['uid'], json['title'], json['description'],
        json['quantity'], json['picture']);
  }

  String getUID() {
    return uid;
  }

  String getTitle() {
    return title;
  }

  int getQuantity() {
    return quantity;
  }

  String getPicture() {
    return picture;
  }

  @override
  String toString() {
    return description;
  }

  // String details() {
  //   String str = '';
  //   items
  //       .map((e) => {
  //             if (str != '') {str += ', '},
  //             str += '(${e['quantity']}) ${e['title']}'
  //           })
  //       .toList();
  //   return str;
  // }
}
