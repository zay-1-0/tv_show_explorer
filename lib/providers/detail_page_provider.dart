

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../classes/show.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';

final detailPageShowProvider = FutureProvider.family<Show?, int>((ref, showId) async {
  ApiService apiService=GetIt.instance.get<ApiService>();
  DatabaseService databaseService=GetIt.instance.get<DatabaseService>();

  Show? show= await databaseService.getShowFromDatabase(showId);

  if(show==null){
    Map? map= await apiService.fetchShow(showId);
    if(map!=null) {
      show = Show.fromJson(map);
    }
  }

  return show;



});