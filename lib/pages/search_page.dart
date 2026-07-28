
import 'dart:async';


import 'package:flutter/material.dart';

import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/services/api_service.dart';
import 'package:tv_show_explorer/widgets/show_list_view.dart';

import '../services/database_service.dart';

class SearchPage extends StatefulWidget {
  final ValueChanged<Show> didSelectShow;
  final ApiService apiService;
  const SearchPage({super.key, required this.didSelectShow, required this.apiService});


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final scrollController=ScrollController();
  TextEditingController _searchQuery= TextEditingController();
  Timer? _debounce;
  String _searchText='';
  List<Show> _showResults=[];


  Future<void> _onSearchChanged() async {
    String query;

    if(_debounce?.isActive?? false)_debounce?.cancel();
    _debounce=Timer(const Duration(milliseconds: 400),
        () async {
      if(_searchQuery.text!=_searchText && _searchQuery.text.length>=2){

         query=_searchQuery.text.toString().toLowerCase();

        final results = await widget.apiService.fetchSearchResults(query);
        final shows = results?.map((r) => Show.fromJson(r['show'])).toList()??[];
        await DatabaseService.putShowsinDatabase(shows);
        setState(() => _showResults = shows);

        setState(() {
          _searchText=query;
        });
      }

        }
        );
  }

  @override
  void dispose() {

    _searchQuery.removeListener(_onSearchChanged);
    _searchQuery.dispose();
    _debounce?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchQuery.addListener(_onSearchChanged);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for shows'),
        backgroundColor: Colors.white,
      ),

      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _searchQuery,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.5,
                  ),
                ),
                hintText: 'Type show\'s name'
              ),


            ),
            if(_showResults.isEmpty)
              Text(
                  'No Results',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                ),
              )
            else if(_showResults.isNotEmpty)
              Expanded(
                  child: ShowListView(shows: _showResults, scrollController: scrollController, didSelectShow: widget.didSelectShow,isSearch: true,)
              )

          ],
        ),
      ),
    );
  }
}
