import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_show_explorer/services/database_service.dart';
import 'package:tv_show_explorer/widgets/show_list_view.dart';

import '../classes/show.dart';


final favoritesProvider = StreamProvider<List<Show>>((ref) {
  final databaseService=GetIt.instance.get<DatabaseService>();
  return databaseService.getFavoritesStream();
});

class FavoritesPage extends ConsumerWidget {


  const FavoritesPage({super.key,});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(favoritesProvider).when(
      data: (shows) => Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0xff7c1405),
          title: Text(
            'Favorites',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
            ),
          ),
        ),
          body: ShowListView(shows: shows, isFavorite: true,
          ),

      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => const Text('Something went wrong'),
    );
  }
}
