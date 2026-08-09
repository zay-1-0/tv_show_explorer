import 'package:flutter/material.dart';

import 'package:tv_show_explorer/theme/app_colors.dart';

/// The shared placeholder for every empty, "nothing found" and error state.
///
/// Renders a tinted icon badge, a headline and a supporting line, plus an
/// optional action button used for retrying a failed request.
///
/// Meant to be placed in a `SliverFillRemaining(hasScrollBody: false)`, which
/// centres it in the leftover space and lets it grow and scroll when it does
/// not fit — so this widget deliberately does not scroll itself.
class EmptyStateView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Color accent;

  const EmptyStateView({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.accent = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 112,
              width: 112,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 56, color: accent),
            ),

            const SizedBox(height: 24),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
                color: AppColors.inkMuted,
              ),
            ),

            if (onAction != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons.refresh_rounded, size: 20),
                label: Text(actionLabel ?? 'Retry'),
                style: FilledButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
