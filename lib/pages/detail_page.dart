
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tv_show_explorer/providers/detail_page_provider.dart';
import 'package:tv_show_explorer/providers/favorites_provider.dart';
import 'package:tv_show_explorer/theme/app_colors.dart';
import 'package:tv_show_explorer/widgets/empty_state_view.dart';
import 'package:tv_show_explorer/widgets/genre_chip.dart';
import 'package:tv_show_explorer/widgets/info_card.dart';
import 'package:tv_show_explorer/widgets/poster_view.dart';
import 'package:tv_show_explorer/widgets/rating_pill.dart';

import 'package:tv_show_explorer/classes/show.dart';


class DetailWidget extends ConsumerWidget{

  final int showId;


  const DetailWidget({super.key, required this.showId,});

  /// One inset for every block on the page.
  static const double _gutter = 20;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final show = ref.watch(detailPageShowProvider(showId));

    return show.when(
      loading: ()  {
        return detailPage(context, null, true, ref);
      },
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text('Show Details')),
        body: EmptyStateView(
          icon: Icons.error_outline_rounded,
          title: 'Couldn\'t load this show',
          message: 'Check your connection and try again.',
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(detailPageShowProvider(showId)),
        ),
      ),
      data: (currentShow){

       return detailPage(context, currentShow, false, ref);

      }
    );


  }

  Widget detailPage(
      BuildContext context,
      Show? currentShow,
      bool isLoading,
      WidgetRef ref
      ){

    final isFavorite=ref.watch(isFavoriteProvider(currentShow?.showID??0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Details'),
      ),
      body: Skeletonizer(
        enabled: isLoading,
        child: LayoutBuilder(
          builder: (context, viewportConstraints) {
            return Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.right,
              thickness: 8,
              radius: const Radius.circular(18),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      _hero(currentShow),

                      if (currentShow?.genres.isNotEmpty ?? false)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(_gutter, 16, _gutter, 0),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: currentShow!.genres
                                .map((genre) => GenreChip(label: genre))
                                .toList(),
                          ),
                        ),

                      if ((currentShow?.yearsLabel ?? '').isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(_gutter, 12, _gutter, 0),
                          child: Text(
                            currentShow!.yearsLabel,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.inkMuted,
                            ),
                          ),
                        ),

                      const Padding(
                        padding: EdgeInsets.fromLTRB(_gutter, 24, _gutter, 8),
                        child: Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ink,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: _gutter),
                        child: ReadMoreText(
                          currentShow?.summary ?? '',
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          colorClickableText: AppColors.primary,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: '\n Show less',
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: AppColors.inkMuted,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(_gutter, 28, _gutter, 0),
                        child: InfoCard(
                          rows: [
                            InfoRow('Schedule', currentShow?.scheduleLabel ?? ''),
                            InfoRow('Network', currentShow?.networkLabel ?? ''),
                            InfoRow('Status', currentShow?.statusLabel ?? ''),
                            InfoRow('Runtime', currentShow?.runtimeLabel ?? ''),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      SafeArea(
                        bottom: true,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(_gutter, 0, _gutter, 20),
                          child: SizedBox(
                            height: 52,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                backgroundColor: isFavorite
                                    ? AppColors.primary
                                    : AppColors.primary.withValues(alpha: 0.10),
                                foregroundColor: isFavorite
                                    ? Colors.white
                                    : AppColors.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline_rounded,
                              ),
                              label: Text(
                                isFavorite
                                    ? 'Remove from favorites'
                                    : 'Add to favorites',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: currentShow == null ? null : (){
                                if(isFavorite) {
                                  ref.read(favoriteControllerProvider.notifier).removeFavorite(currentShow);
                                } else {
                                  ref.read(favoriteControllerProvider.notifier).addFavorite(currentShow);
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );

  }

  /// Poster with the title and rating overlaid, mirroring the show cards so a
  /// tapped card reads as expanding into this page.
  Widget _hero(Show? currentShow) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [

          PosterView(
            url: currentShow?.posterURL ?? '',
            fallbackUrl: currentShow?.bannerURL,
            cacheWidth: 1080,
          ),

          const PosterScrim(),

          Positioned(
            left: _gutter,
            right: _gutter,
            bottom: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    currentShow?.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                if ((currentShow?.rating ?? 0) > 0) ...[
                  const SizedBox(width: 12),
                  RatingPill(rating: currentShow!.rating),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
