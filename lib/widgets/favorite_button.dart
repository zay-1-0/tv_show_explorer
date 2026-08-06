

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_show_explorer/controllers/favorite_page_controller.dart';
import '../classes/show.dart';
import '../services/database_service.dart';




final favoriteControllerProvider =
AsyncNotifierProvider<FavoritePageController, void>(
  FavoritePageController.new,
);

final isFavoriteProvider =
StreamProvider.family<bool, int>((ref, showId) {
  final database = GetIt.instance<DatabaseService>();

  return database.watchIsFavorite(showId);
});

class FavoriteButton extends ConsumerWidget {
  final Show show;


  const FavoriteButton({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final isFavorite = ref.watch(isFavoriteProvider(show.showID));

    return IconButton(

      onPressed: (){

        ref.read(favoriteControllerProvider.notifier).onPressed(show);
        
      },
      icon: Icon(
        isFavorite.when(
          data: (favorite) =>
          favorite ?  Icons.favorite :  Icons.favorite_outline_rounded,
          loading: () => Icons.favorite_outline_rounded,
          error: (_, __) => Icons.favorite_outline_rounded,
        ),
        size: 34,
        color: Color(0xffec3013),



        ),
    );

    

  }
}