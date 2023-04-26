class PackageItem {
  String _id;
  String title;
  String description;
  int quantity;
  String picture;

  PackageItem(
      this._id, this.title, this.description, this.quantity, this.picture);

  factory PackageItem.fromJson(dynamic json) {
    return PackageItem(json['_id'], json['name'], json['desc'],
        json['quantity'], json['cover_pic']);
  }

  String getUID() {
    return _id;
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
