

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tv_show_explorer/services/api_service.dart';
import 'package:tv_show_explorer/services/database_service.dart';

import 'package:tv_show_explorer/widgets/show_list_view.dart';


import '../classes/show.dart';

class HomePage extends StatefulWidget {

  final ValueChanged<Show> didSelectShow;
  final ApiService apiService;

  const HomePage({super.key, required this.didSelectShow, required this.apiService});

  @override
  State<HomePage> createState() => _HomePageState();
}








class _HomePageState extends State<HomePage> {

  late List<Show> shows=[];
  int id = 0;
  int offset=10;
  int currentPageNumber=0;
  final scrollController=ScrollController();
  late Future<void> showFuture;
  bool isLoaded=false;
  bool isLoading=false;
  StreamSubscription? showStreamSet;
  StreamSubscription? showStreamAdd;




  Future<void> setUpShows() async{

    if(isLoading)return;

    final List<dynamic>? pageResults=await widget.apiService.fetchResultsbyPage(currentPageNumber++);

    final showsResults = pageResults?.map((map)=>Show.fromJson(map)).toList();
    setState(() {
      shows=showsResults??[];
    });

    await DatabaseService.putShowsinDatabase(shows);




    isLoaded=true;

  }

  Future<void> addShows() async{

    if(!isLoaded)return;
    if(isLoading)return;

    isLoading=true;

    final List<dynamic>? searchResults=await widget.apiService.fetchResultsbyPage(currentPageNumber++);

    final showsResults = searchResults?.map((map)=>Show.fromJson(map)).toList();
    setState(() {
      setState(() {
        shows = [...shows, ...?showsResults];
      });;
    });

    isLoading=false;

    await DatabaseService.putShowsinDatabase(shows);


  }








  @override
  void initState() {
    super.initState();
    if(!isLoaded) {
      setUpShows();
    }
    
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.offset){
        addShows();
      }
    });
  }

  @override
  void dispose() {
    showStreamSet?.cancel();
    showStreamAdd?.cancel();
    scrollController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home — Popular Shows',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
      body: ShowListView(shows: shows, scrollController: scrollController, didSelectShow: widget.didSelectShow,isSearch: false,)


    );
  }
}

