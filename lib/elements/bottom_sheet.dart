import 'package:flutter/material.dart';

@immutable
abstract class BotomSheet {
  static RoundedRectangleBorder shape() => const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      );
}
