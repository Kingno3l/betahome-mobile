// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:beta_home/models/listing_item.dart';
import 'package:flutter/foundation.dart';

class DataModel extends ChangeNotifier {
  final List<ListingItem> _cart = [];
  double cartTotal = 0;
  ProfileModel? _profile;
  double _balance = 0;

  List<ListingItem> get cartItems => _cart;

  set profile(dynamic json) {
    _profile = json != null ? ProfileModel.fromJson(json) : json;
    notifyListeners();
  }

  set balance(bal) {
    _balance = double.parse(bal.toString());
    notifyListeners();
  }

  String? _profilePicture;

  String? get profilePicture => _profilePicture;

  set profilePicture(String? value) {
    _profilePicture = value;
    notifyListeners();
  }


  Future<void> uploadProfilePicture(File file) async {
    try {
      // TODO: Implement the code to upload the profile picture to your server
      final String imageUrl = "";
      profilePicture = imageUrl;
    } catch (e) {
      // Handle any errors that might occur during the upload process.
      print('Error uploading profile picture: $e');
    }
  }

  ProfileModel? get profile => _profile;
  double get balance => _balance;

  void addToCart(ListingItem item) {
    _cart.add(item);
    cartTotal = cartTotal + item.price;
    notifyListeners();
  }

  void removeFromCart(ListingItem item) {
    _cart.remove(item);
    cartTotal = cartTotal - item.price;
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    cartTotal = 0;
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
  final String? _last_login;
  final String? _referral_code;
  final bool? _is_beta_help;

  ProfileModel(
    this._first_name,
    this._last_name,
    this._email,
    this._country_code,
    this._phone,
    this._address,
    this._profile_pic,
    this._last_login,
    this._referral_code,
    this._is_beta_help,
  );

  factory ProfileModel.fromJson(dynamic json) {
    return ProfileModel(
      json['first_name'],
      json['last_name'],
      json['email'],
      json['country_code'],
      json['phone'],
      json['address'],
      json['profile_pic'],
      json['last_login'],
      json['referral_code'],
      json['is_beta_help'],
    );
  }

  String? get first_name => _first_name;
  String? get last_name => _last_name;
  String? get email => _email;
  String? get country_code => _country_code;
  String? get phone => _phone;
  String? get address => _address;
  String? get profile_pic => _profile_pic;
  get last_login => _last_login;
  get referral_code => _referral_code ?? '';
  get is_beta_help => _is_beta_help ?? false;
}
