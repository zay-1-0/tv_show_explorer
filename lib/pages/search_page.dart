
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/controllers/search_page_conroller.dart';

import 'package:tv_show_explorer/widgets/show_list_view.dart';



final searchPageControllerProvider= AsyncNotifierProvider<SearchPageConroller, List<Show>>((){
  return SearchPageConroller();
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
            'Search for shows',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          TextField(
            controller: searchQuery,
            onChanged: (value){
              ref.read(searchPageControllerProvider.notifier).onSearchChanged(value);
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 1.5,
                ),
              ),
              hintText: 'Type show\'s name'
            ),


          ),

          searchState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error searching: $err')),
            data: (searchResults){
              if(searchResults.isEmpty) {
                return Text(
                  'No Results',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                  ),
                );
              }

              return Expanded(
                child: ShowListView(
                  shows: searchResults,
                  isSearch: true,),
              );




            }
          ),

        ],
      ),
    );
  }
}
