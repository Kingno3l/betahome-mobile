
class MarketItemCategory {
  String _id;
  String _name;

  MarketItemCategory(this._id, this._name);

  factory MarketItemCategory.fromJson(dynamic json) {
    return MarketItemCategory(json['_id'], json['name']);
  }

  get id => _id;
  get name => _name;
}
