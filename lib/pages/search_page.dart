
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/controllers/search_page_conroller.dart';

import 'package:tv_show_explorer/theme/app_colors.dart';
import 'package:tv_show_explorer/widgets/empty_state_view.dart';
import 'package:tv_show_explorer/widgets/show_sliver_list.dart';



final searchPageControllerProvider= AsyncNotifierProvider<SearchPageController, List<Show>>((){
  return SearchPageController();
});


final textQueryProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

/// Mirrors what is currently typed, so the page can tell "nothing searched
/// yet" apart from "searched and found nothing". [SearchPageController] only
/// updates its state for queries of two characters or more, so its results
/// alone cannot distinguish the two.
class SearchQuery extends Notifier<String> {
  @override
  String build() => '';

  void set(String value) => state = value;
}

final searchQueryProvider = NotifierProvider<SearchQuery, String>(SearchQuery.new);

/// Shortest query [SearchPageController.onSearchChanged] will act on.
const int _minQueryLength = 2;

class SearchPage extends ConsumerWidget {

  const SearchPage({super.key,});




  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchQuery = ref.watch(textQueryProvider);
    final searchState= ref.watch(searchPageControllerProvider);
    final query = ref.watch(searchQueryProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // The field is the page's label, so no title and no leading icon.
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 72,
            titleSpacing: 16,
            title: TextField(
              controller: searchQuery,
              onChanged: (value){
                ref.read(searchQueryProvider.notifier).set(value);
                ref.read(searchPageControllerProvider.notifier).onSearchChanged(value);
              },
              decoration: InputDecoration(
                hintText: 'Search shows',
                hintStyle: const TextStyle(color: AppColors.divider),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.inkMuted,
                ),
                suffixIcon: query.isEmpty ? null : IconButton(
                  icon: const Icon(Icons.close_rounded),
                  color: AppColors.inkMuted,
                  tooltip: 'Clear',
                  onPressed: () {
                    searchQuery.clear();
                    ref.read(searchQueryProvider.notifier).set('');
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                color: AppColors.inkMuted,
                fontSize: 17,
              ),
            ),
          ),

          searchState.when(
            loading: () => const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, stack) => SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyStateView(
                icon: Icons.wifi_off_rounded,
                title: 'Couldn\'t search',
                message: 'Check your connection and try again.',
                actionLabel: 'Retry',
                accent: AppColors.inkMuted,
                onAction: () => ref.invalidate(searchPageControllerProvider),
              ),
            ),
            data: (searchResults){

              // Below the minimum length nothing has been searched for yet.
              // This also covers clearing the field, which the controller
              // ignores, otherwise leaving stale results on screen.
              if(query.trim().length < _minQueryLength) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyStateView(
                    icon: Icons.search_rounded,
                    title: 'Find a show',
                    message: 'Type at least two letters to search TVmaze.',
                    accent: AppColors.inkMuted,
                  ),
                );
              }

              if(searchResults.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyStateView(
                    icon: Icons.search_off_rounded,
                    title: 'No shows found',
                    message: 'Nothing matched "${query.trim()}". Try a different spelling.',
                    accent: AppColors.inkMuted,
                  ),
                );
              }

              return ShowSliverList(
                  shows: searchResults,
                );

            }
          ),
        ],
      ),
    );
  }
}
