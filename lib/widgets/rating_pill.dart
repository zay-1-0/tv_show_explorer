import 'package:flutter/material.dart';

/// Translucent star + score pill, sized to sit over a poster scrim.
///
/// Collapses to nothing when there is no rating, so callers don't repeat that
/// check — TVMaze returns 0 for unrated shows.
class RatingPill extends StatelessWidget {
  final double rating;

  const RatingPill({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    if (rating <= 0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: Colors.white, size: 16),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
