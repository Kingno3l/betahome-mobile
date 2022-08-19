// ignore_for_file: non_constant_identifier_names
import 'package:flutter/foundation.dart';

class DataModel extends ChangeNotifier {
  final List<int> _cart = [];
  ProfileModel? _profile;

  List<int> get items => _cart;

  set profile(dynamic json) {
    _profile = json != null ? ProfileModel.fromJson(json) : json;
    notifyListeners();
  }

  ProfileModel? get profile => _profile;

  void addToCart(int item) {
    _cart.add(item);
    notifyListeners();
  }

  void remove(int item) {
    _cart.remove(item);
    notifyListeners();
  }
}

class ProfileModel {
  final String? _first_name;
  final String? _last_name;
  final String? _email;
  final String? _country_code;
  final String? _phone;
  final String? _address;
  final String? _profile_pic;

  ProfileModel(this._first_name, this._last_name, this._email,
      this._country_code, this._phone, this._address, this._profile_pic);

  factory ProfileModel.fromJson(dynamic json) {
    return ProfileModel(
        json['first_name'],
        json['last_name'],
        json['email'],
        json['country_code'],
        json['phone'],
        json['address'],
        json['profile_pic']);
  }

  String? get first_name => _first_name;
  String? get last_name => _last_name;
  String? get email => _email;
  String? get country_code => _country_code;
  String? get phone => _phone;
  String? get address => _address;
  String? get profile_pic => _profile_pic;
}
