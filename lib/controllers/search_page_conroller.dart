
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tv_show_explorer/services/api_service.dart';
import 'package:get_it/get_it.dart';

import '../classes/show.dart';

class SearchPageController extends AsyncNotifier<List<Show>>{

  Timer? _debounce;
  String _lastSearchText = '';
  final GetIt _getIt=GetIt.instance;
  late ApiService _apiService;

  @override
  FutureOr<List<Show>> build() {
    ref.onDispose(() => _debounce?.cancel());
    _apiService=_getIt.get<ApiService>();
    return [];
  }

  Future<void> onSearchChanged(String query) async {

    if(_debounce?.isActive?? false)_debounce?.cancel();
    _debounce=Timer(const Duration(milliseconds: 400),
            () async {
          if(query!=_lastSearchText && query.length>=2){

            _lastSearchText=query;

            state = const AsyncValue.loading();

            
            state=await AsyncValue.guard(() async {

              final results = await _apiService.fetchSearchResults(query);
              final shows = results?.map((r) => Show.fromJson(r['show'])).toList()??[];
              return shows;

            });



          }

        }
    );
  }

}

