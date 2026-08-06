

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../classes/show.dart';
import '../providers/favorites_provider.dart';









class FavoriteButton extends ConsumerWidget {
  final Show show;


  FavoriteButton({
    super.key,
    required this.show,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final isFavorite = ref.watch(isFavoriteProvider(show.showID));

    return IconButton(

      onPressed: (){


        if(isFavorite) {
          ref.read(favoriteControllerProvider.notifier).removeFavorite(show);
        } else {
          ref.read(favoriteControllerProvider.notifier).addFavorite(show);
        }
      },

      icon: Icon(

        isFavorite? Icons.favorite : Icons.favorite_outline_rounded,
        size: 34,
        color: Color(0xffec3013),

      ),
    );

    

  }
}