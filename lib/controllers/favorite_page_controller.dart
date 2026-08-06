
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_show_explorer/services/api_service.dart';

import '../classes/show.dart';
import '../services/database_service.dart';

class FavoritePageController extends AsyncNotifier<void>{

  final GetIt _getIt=GetIt.instance;


  late DatabaseService _databaseService;
  late ApiService _apiService;

  @override
  FutureOr<void> build() {
    _databaseService=_getIt.get<DatabaseService>();
    _apiService=_getIt.get<ApiService>();
  }

  Future<void> addFavorite(Show show) async {
    state = const AsyncLoading();

    show.isFavorite=true;

    state = await AsyncValue.guard(() async {
      if (show.posterURL.isEmpty) {
        final url = await _apiService.fetchPosterUrl(show.showID);

        if (url != null) {
          show.posterURL = url;
        }
      }
      await _databaseService.putShowinDatabase(show);
    });
  }



  Future<void> removeFavorite(Show show) async {
    state = const AsyncLoading();

    show.isFavorite=false;

    state = await AsyncValue.guard(() async {
      await _databaseService.deleteShow(show);
    });
  }

  Future<void> onPressed(Show show)async {

    if(show.isFavorite){
      removeFavorite(show);


    }else{
      addFavorite(show);

    }

  }

}