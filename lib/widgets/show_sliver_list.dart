import 'package:flutter/material.dart';
import 'package:tv_show_explorer/theme/app_colors.dart';
import 'package:tv_show_explorer/widgets/show_card.dart';

import 'package:tv_show_explorer/classes/show.dart';

/// The show list as a sliver, so pages can pair it with a collapsing
/// [SliverAppBar] inside a [CustomScrollView].
///
/// Empty states are the caller's job: they need to be a sibling sliver so the
/// app bar stays on screen when there is nothing to list.
class ShowSliverList extends StatelessWidget {

  final List<Show> shows;
  final bool? isHome;
  final bool? isFavorite;

  const ShowSliverList({super.key, required this.shows, this.isHome, this.isFavorite});

  @override
  Widget build(BuildContext context) {

    return SliverPadding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      sliver: SliverList.builder(
        itemCount: shows.length + 1,
        itemBuilder: (context, index) {
          if (index < shows.length) {
            final show = shows[index];
            return ShowCard(currShow: show,);
          } else if (isHome ?? false) {
            return const Padding(
              padding: EdgeInsets.all(8),
              child: Center(child: CircularProgressIndicator(),),
            );
          } else if (isFavorite ?? false) {
            return const Padding(
              padding: EdgeInsets.fromLTRB(40, 32, 40, 40),
              child: Center(
                child: Text(
                  'That\'s everything you\'ve liked. Head to the home or search page to favorite more shows.',
                  style: TextStyle(
                    color: AppColors.inkMuted,
                    fontSize: 14,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
