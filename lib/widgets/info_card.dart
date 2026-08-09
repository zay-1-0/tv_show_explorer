import 'package:flutter/material.dart';

import 'package:tv_show_explorer/theme/app_colors.dart';

class InfoRow {
  final String label;
  final String value;

  const InfoRow(this.label, this.value);
}

/// Grouped key/value rows on one rounded surface, separated by hairlines.
///
/// Hierarchy comes from the type rather than from heavy rules: a muted label
/// on the left, an emphasised value on the right.
class InfoCard extends StatelessWidget {
  final List<InfoRow> rows;

  const InfoCard({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider.withValues(alpha: 0.35)),
      ),
      child: Column(
        children: [
          for (int i = 0; i < rows.length; i++) ...[
            if (i > 0)
              Divider(
                height: 1,
                thickness: 1,
                color: AppColors.divider.withValues(alpha: 0.35),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rows[i].label,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.inkMuted,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      rows[i].value,
                      textAlign: TextAlign.end,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
