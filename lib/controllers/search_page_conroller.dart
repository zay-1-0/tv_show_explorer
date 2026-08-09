
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tv_show_explorer/classes/search_page_data.dart';

import 'package:tv_show_explorer/services/api_service.dart';
import 'package:get_it/get_it.dart';

import 'package:tv_show_explorer/classes/show.dart';

class SearchPageController extends AsyncNotifier<SearchPageData>{

  Timer? _debounce;
  String _lastSearchText = '';
  final GetIt _getIt=GetIt.instance;
  late ApiService _apiService;
  final String _key = 'recent_searches';


  @override
  SearchPageData build() {
    ref.onDispose(() => _debounce?.cancel());
    _apiService=_getIt.get<ApiService>();
    return  SearchPageData(searchResults: [], query: '');
  }

  Future<void> onSearchChanged(String query) async {

    if(_debounce?.isActive?? false)_debounce?.cancel();
    _debounce=Timer(const Duration(milliseconds: 400),
            () async {
          if(query!=_lastSearchText && query.length>=2){

            _lastSearchText=query;

            state = const AsyncValue.loading();

            await saveQuery(query);

            state=await AsyncValue.guard(() async {

              final results = await _apiService.fetchSearchResults(query);
              final shows = results?.map((r) => Show.fromJson(r['show'])).toList()??[];
              return SearchPageData(searchResults: shows, query: query);

            });



          }

        }
    );
  }

  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> saveQuery(String query) async {
    if (query.trim().isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(_key) ?? [];

    // Remove duplicates and keep the most recent query at the top
    history.remove(query);
    history.insert(0, query);

    // Limit history length (e.g., max 5 items)
    if (history.length > 5) {
      history = history.sublist(0, 5);
    }

    await prefs.setStringList(_key, history);
  }


}

