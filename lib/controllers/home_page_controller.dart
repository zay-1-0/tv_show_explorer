import 'package:flutter_riverpod/legacy.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_show_explorer/classes/home_page_data.dart';
import 'package:tv_show_explorer/services/api_service.dart';
import 'package:tv_show_explorer/services/database_service.dart';

import '../classes/show.dart';

class HomePageController extends StateNotifier<HomePageData>{

  final GetIt _getIt=GetIt.instance;

  late ApiService _apiService;
  late DatabaseService _databaseService;

  HomePageController(super.state){
    _apiService=_getIt.get<ApiService>();
    _databaseService=_getIt.get<DatabaseService>();
    loadShows();
  }

  Future<void> loadShows() async{

    state=state.copyWith(isLoading: true);

    final List<dynamic>? pageResults=await _apiService.fetchResultsbyPage(state.pageNumber);
    final List<Show>? showsResults = pageResults?.map((map)=>Show.fromJson(map)).toList();
    state=state.shows.isEmpty ?  state.copyWith(data:  showsResults??[], newPageNum: (state.pageNumber+1))   :  state.copyWith(data: [...state.shows, ...showsResults??[]], newPageNum: (state.pageNumber+1),isLoading: false);
    await _databaseService.putShowsinDatabase(state.shows);

  }




}