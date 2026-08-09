import 'package:flutter/material.dart';

/// The palette already used across the app, collected in one place so the
/// shared widgets stay consistent.
class AppColors {
  const AppColors._();

  static const Color primary = Color(0xffec3013);
  static const Color primaryDark = Color(0xff7c1405);
  static const Color ink = Color(0xff2f0701);
  static const Color inkMuted = Color(0xff2d2b2b);
  static const Color surface = Color(0xfff3f2f2);
  static const Color divider = Color(0xffa29e9e);

  /// Neutral fill shown behind an image while it loads or when it fails.
  static const Color imagePlaceholder = Color(0xffe0dede);
}
