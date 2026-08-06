
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/controllers/search_page_conroller.dart';

import 'package:tv_show_explorer/widgets/show_list_view.dart';



final searchPageControllerProvider= AsyncNotifierProvider<SearchPageController, List<Show>>((){
  return SearchPageController();
});


final textQueryProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

class SearchPage extends ConsumerWidget {

  const SearchPage({super.key,});




  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchQuery = ref.watch(textQueryProvider);
    final searchState= ref.watch(searchPageControllerProvider);

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
              child: TextField(

                controller: searchQuery,
                onChanged: (value){
                  ref.read(searchPageControllerProvider.notifier).onSearchChanged(value);
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff2d2b2b),
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff2d2b2b),
                        width: 1.5,
                      ),
                    ),
                    hintText: 'Type show\'s name',
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      size: 32,
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xff2d2b2b),
                    ),
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 10.0,
                  ),
                ),
                style: TextStyle(
                  color: Color(0xff2d2b2b),
                  fontSize: 20
                ),

              ),
            )
        ),
      ),

      body:

          searchState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error searching: $err')),
            data: (searchResults){
              if(searchResults.isEmpty) {
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
                  shows: searchResults,
                );




            }
          ),

      //   ],
      // ),
    );
  }
}
