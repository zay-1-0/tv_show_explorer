import 'package:flutter/material.dart';

import 'package:tv_show_explorer/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.surface,

    // Deliberately no `appBarTheme.titleTextStyle`: it takes priority over the
    // large app bar's expanded style, which would render the big title at the
    // collapsed size. SliverAppBar.large reads these two instead — titleLarge
    // when collapsed (and for plain AppBars), headlineMedium when expanded.
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.ink,
      elevation: 0,
      scrolledUnderElevation: 3,
      centerTitle: false,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: AppColors.primary.withValues(alpha: 0.15),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          size: 26,
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.inkMuted,
        ),
      ),
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => TextStyle(
          fontSize: 12,
          fontWeight: states.contains(WidgetState.selected)
              ? FontWeight.w600
              : FontWeight.w400,
          color: states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.inkMuted,
        ),
      ),
    ),
  );
}
