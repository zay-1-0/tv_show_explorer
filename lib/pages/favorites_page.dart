import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_show_explorer/widgets/empty_state_view.dart';
import 'package:tv_show_explorer/widgets/show_sliver_list.dart';

import '../providers/favorites_provider.dart';

class FavoritesPage extends ConsumerWidget {

  const FavoritesPage({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Favorites'),
            pinned: true,
          ),

          ref.watch(favoritesProvider).when(
            data: (shows) {
              if (shows.isEmpty) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyStateView(
                    icon: Icons.favorite_border,
                    title: 'No favorites yet',
                    message: 'Tap the heart on any show to save it here.',
                  ),
                );
              }

              return ShowSliverList(shows: shows, isFavorite: true,);
            },
            loading: () => const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyStateView(
                icon: Icons.error_outline_rounded,
                title: 'Couldn\'t load favorites',
                message: 'Something went wrong reading your saved shows.',
                actionLabel: 'Retry',
                onAction: () => ref.invalidate(favoritesProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
