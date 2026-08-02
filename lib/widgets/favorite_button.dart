

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../classes/show.dart';
import '../services/database_service.dart';

final showProvider = StreamProvider.family<Show?, int>((ref, showId) {
  final databaseService = GetIt.instance.get<DatabaseService>();
  return databaseService.getShowStream(showId);
});

class FavoriteButton extends ConsumerWidget {
  final int showId;


  const FavoriteButton({
    super.key,
    required this.showId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final showAsync = ref.watch(showProvider(showId));

    return showAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error searching: $err')),
      data: (show){
        if(show==null){
          return const SizedBox.shrink();
        }

        return IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
          ),

          onPressed: () async {
            show.isFavorite = !show.isFavorite;
            final databaseService=GetIt.instance.get<DatabaseService>();
            databaseService.putShowinDatabase(show);
          },
          icon: Icon(
            Icons.favorite,
            size: 25,
            color: show.isFavorite ? Colors.red : Colors.black38,
          ),
        );


      }
    );

  }
}