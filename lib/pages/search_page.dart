
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_show_explorer/classes/search_page_data.dart';

import 'package:tv_show_explorer/controllers/search_page_conroller.dart';

import 'package:tv_show_explorer/widgets/show_list_view.dart';



final searchPageControllerProvider= AsyncNotifierProvider<SearchPageController, SearchPageData>((){
  return SearchPageController();
});


final textQueryProvider = Provider<SearchController>((ref) {
  final controller = SearchController();
  ref.onDispose(controller.dispose);
  return controller;
});

class SearchPage extends ConsumerWidget {

  const SearchPage({super.key,});




  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchQuery = ref.watch(textQueryProvider);
    final searchState= ref.watch(searchPageControllerProvider);
    final recentSearchesNotifier=  ref.watch(searchPageControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
        backgroundColor: Color(0xff2d2b2b),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Icon(
            Icons.search_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),

        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              child:
                SearchAnchor.bar(
                    suggestionsBuilder:(context, controller) async
                    {
                      final recentSearches=await recentSearchesNotifier.getHistory();
                      return recentSearches.map((search)=> ListTile(
                        title: Text(
                          search
                        ),
                        onTap: (){
                          ref.read(searchPageControllerProvider.notifier).onSearchChanged(search);
                          searchQuery.closeView(search);
                        },
                      )
                      );
                      },
                    searchController: searchQuery,
                    barShape: WidgetStateProperty.all(
                    StadiumBorder(
                    ),
                  ),
                  isFullScreen: false,
                  onSubmitted: (value){
                      ref.read(searchPageControllerProvider.notifier).onSearchChanged(value);
                      searchQuery.closeView(value);
                  },
                  onClose: searchQuery.clear,
                  viewBuilder: (Iterable<Widget> recents){
                      return ListView.builder(
                        itemCount: recents.length,
                        itemBuilder: (context,index){
                          return recents.elementAt(index);
                        },
                        shrinkWrap: true,
                      );
                  },
                  shrinkWrap: true,
                  viewHintText: 'Recent Searches',
                  barHintText: 'Type a show\'s name',
                ),
            )
        ),
      ),

      body:

          searchState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error searching: $err')),
            data: (searchResults){
              if(searchResults.searchResults.isEmpty) {
                return Center(
                  child: Text(
                    'Try searching for something',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff2d2b2b),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }

              return ShowListView(
                shows: searchResults.searchResults,
                isSearch: true,
                query: searchResults.query ,
                );




            }
          ),
    );
  }
}
