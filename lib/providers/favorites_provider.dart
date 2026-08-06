import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../classes/show.dart';
import '../controllers/favorite_page_controller.dart';
import '../services/database_service.dart';

final favoritesProvider = StreamProvider<List<Show>>((ref) {
  final databaseService=GetIt.instance.get<DatabaseService>();
  return databaseService.getFavoritesStream();
});

final isFavoriteProvider =
Provider.family<bool, int>((ref, showId) {
  final favorites = ref.watch(favoritesProvider).value??[];

  return favorites.any((show) => show.showID == showId);
});


final favoriteControllerProvider =
AsyncNotifierProvider<FavoritePageController, void>(
  FavoritePageController.new,
);