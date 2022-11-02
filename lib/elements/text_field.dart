import 'package:flutter/material.dart';

@immutable
abstract class TxtField {
  static TextStyle errorStyle = const TextStyle(
    height: 0.3,
    fontStyle: FontStyle.italic,
    fontSize: 10,
  );
}
