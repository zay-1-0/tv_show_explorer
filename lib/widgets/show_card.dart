import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_show_explorer/providers/main_page_provider.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';
import 'package:tv_show_explorer/widgets/genre_chip.dart';
import 'package:tv_show_explorer/widgets/poster_view.dart';
import 'package:tv_show_explorer/widgets/rating_pill.dart';

import 'package:tv_show_explorer/classes/show.dart';

class ShowCard extends ConsumerWidget {
  final Show currShow;
  const ShowCard({super.key, required this.currShow});

  static const double _radius = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.18),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                PosterView(
                  url: currShow.bannerURL,
                  fallbackUrl: currShow.imageURL,
                  cacheWidth: 1080,
                ),

                const PosterScrim(),

                // Sits above the image so the tap ripple is visible, but below
                // the favourite button so that keeps its own taps.
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(selectedShowProvider.notifier)
                            .selectNewShow(currShow);
                      },
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),

                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 14,
                  child: IgnorePointer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                currShow.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (currShow.rating > 0) ...[
                              const SizedBox(width: 8),
                              RatingPill(rating: currShow.rating),
                            ],
                          ],
                        ),

                        if (currShow.genres.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: currShow.genres
                                .take(2)
                                .map(
                                  (genre) =>
                                      GenreChip(label: genre, onDark: true),
                                )
                                .toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 6,
                  right: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                    child: FavoriteButton(show: currShow),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
