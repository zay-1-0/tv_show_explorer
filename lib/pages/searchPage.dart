
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/widgets/showListView.dart';

class SearchPage extends StatefulWidget {
  final ValueChanged<int> didSelectShow;
  const SearchPage({super.key, required this.didSelectShow});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final scrollController=ScrollController();
  TextEditingController _searchQuery= TextEditingController();
  Timer? _debounce;
  late String _testResult='';
  String _searchText='';
  List<Show> _showResults=[];


  Future<void> _onSearchChanged() async {
    String query;
    List<Show> showsRetrieved=[];

    if(_debounce?.isActive?? false)_debounce?.cancel();
    _debounce=Timer(const Duration(milliseconds: 400),
        () async {
      if(_searchQuery.text!=_searchText && _searchQuery.text.length>=2){

         query=_searchQuery.text.toString().toLowerCase();
        Uri url=Uri.https('api.tvmaze.com','search/shows',{'q' : query});
        Response response= await get(url);
         RegExp regex = RegExp(r'"id"\s*:\s*(\d+)\s*,\s*"url"');
         Iterable<Match> matches = regex.allMatches(response.body);
         List<int> ids = matches.map((m) => int.parse(m.group(1)!)).toList();

         ids.forEach((id){

           Show toAdd=Show(showID: id);
           toAdd.setData();
           showsRetrieved.add(toAdd);

         });





        setState(() {
          _testResult=query;
          _showResults=showsRetrieved;
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
        margin: EdgeInsets.all(10.0),
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
            if(_showResults.length==0)
              Text(
                  'No Reults',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w400,
                ),
              )
            else if(_showResults.length>0)
              Expanded(
                  child: ShowListView(shows: _showResults, scrollController: scrollController, didSelectShow: widget.didSelectShow,isSearch: true,)
              )

          ],
        ),
      ),
    );
  }
}
