

import 'package:flutter/material.dart';

import '../classes/show.dart';
import '../services/database_service.dart';

class FavoriteButton extends StatelessWidget {
  final int showId;
  final bool isDetails;

  const FavoriteButton({
    super.key,
    required this.showId,
    required this.isDetails,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Show?>(
      stream: DatabaseService.db.shows.watchObject(
        showId,
        fireImmediately: true,
      ),
      builder: (context, snapshot) {
        final show = snapshot.data;

        if (show == null) {
          return const SizedBox.shrink();
        }

        return IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),

          onPressed: () async {
            await DatabaseService.db.writeTxn(() async {
              show.isFavorite = !show.isFavorite;
              await DatabaseService.db.shows.put(show);
            });
          },
          icon: Icon(
            Icons.favorite,
            size: 25,
            color: show.isFavorite ? Colors.red : Colors.black26,
          ),
        );
      },
    );
  }
}