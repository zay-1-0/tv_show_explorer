import 'package:flutter/material.dart';

import 'package:tv_show_explorer/theme/app_colors.dart';

/// A single genre pill.
///
/// The light variant mirrors the bordered look used on the details page; the
/// [onDark] variant is translucent white, for use over a poster scrim.
class GenreChip extends StatelessWidget {
  final String label;
  final bool onDark;

  const GenreChip({super.key, required this.label, this.onDark = false});

  /// TVMaze spells this one out in full, which is too wide for a chip.
  static const Map<String, String> _abbreviations = {
    'Science-Fiction': 'Sci-Fi',
  };

  @override
  Widget build(BuildContext context) {
    final Color foreground = onDark ? Colors.white : AppColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: onDark ? Colors.white.withValues(alpha: 0.18) : Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: onDark ? Colors.white.withValues(alpha: 0.45) : AppColors.primary,
          width: onDark ? 1.0 : 1.5,
        ),
      ),
      child: Text(
        _abbreviations[label] ?? label,
        style: TextStyle(
          color: foreground,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
