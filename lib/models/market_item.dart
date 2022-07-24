class MarketItem {
  int uid;
  String name;
  String imgUrl;
  String description;
  double price;
  int rated;

  MarketItem(this.uid, this.name, this.imgUrl, this.description, this.price,
      this.rated);

  // factory MarketItem.fromJson(dynamic json) {
  //   return MarketItem(json['package_name'], json['description'], json['color'],
  //       json['price'], json['items']);
  // }

  int getUID() {
    return uid;
  }

  String getName() {
    return name;
  }

  String getImgUrl() {
    return imgUrl;
  }

  double getPrice() {
    return price;
  }

  bool isRated() {
    return rated == 1;
  }

  @override
  String toString() {
    return description;
  }
}
