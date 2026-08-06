import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_show_explorer/classes/home_page_data.dart';
import 'package:tv_show_explorer/services/api_service.dart';

import '../classes/show.dart';

class HomePageController extends AsyncNotifier<HomePageData>{

  final GetIt _getIt=GetIt.instance;

  late ApiService _apiService;

  @override
  FutureOr<HomePageData> build() async {
    _apiService=_getIt.get<ApiService>();
    final List<dynamic>? pageResults=await _apiService.fetchResultsbyPage(0);
    final List<Show>? showsResults = pageResults?.map((map)=>Show.fromJson(map)).toList();
    return HomePageData(shows: showsResults??[], pageNumber: 1);
  }

  Future<void> loadShows() async{

    state=const AsyncValue.loading();

    state= await AsyncValue.guard(() async {
      final List<dynamic>? pageResults=await _apiService.fetchResultsbyPage(state.value!.pageNumber);
      final List<Show>? showsResults = pageResults?.map((map)=>Show.fromJson(map)).toList();
      return HomePageData(shows: showsResults??[], pageNumber: state.value!.pageNumber+1);

    });

  }






}