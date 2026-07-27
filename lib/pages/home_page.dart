

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:isar_community/isar.dart';
import 'package:tv_show_explorer/services/api_service.dart';
import 'package:tv_show_explorer/services/database_service.dart';
import 'package:tv_show_explorer/widgets/show_card.dart';
import 'package:tv_show_explorer/widgets/show_list_view.dart';


import '../classes/show.dart';

class HomePage extends StatefulWidget {

  final ValueChanged<int> didSelectShow;
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

  late Stream<List<Show>> _builderShowStream;






  Future<void> setUpShows() async{

    if(isLoading)return;

    await DatabaseService.db.writeTxn(() async{
      await DatabaseService.db.shows.clear();
    });



    // for(int count=0 ; count<offset ; count++) {
    //
    //   Map? data = await widget.apiService.fetchShow(id);
    //
    //   if (data!=null) {
    //
    //     Show toAdd=Show.fromJson(data);
    //
    //   }else{
    //     count--;
    //   }
    //     id++;
    //
    //
    // }

    final List<dynamic>? searchResults=await widget.apiService.fetchResultsbyPage(currentPageNumber++);

    final showsResults = searchResults?.map((map)=>Show.fromJson(map['show'])).toList();
    setState(() {
      shows=showsResults??[];
    });




    isLoaded=true;
    //print(shows);

  }

  Future<void> addShows() async{

    if(!isLoaded)return;
    if(isLoading)return;

    isLoading=true;

    //int alreadyLoaded=shows.length;



    final List<dynamic>? searchResults=await widget.apiService.fetchResultsbyPage(currentPageNumber++);

    final showsResults = searchResults?.map((map)=>Show.fromJson(map['show'])).toList();
    setState(() {
      shows=showsResults??[];
    });

    isLoading=false;

    // List<Show> newShows=[];
    // showStreamAdd= Databaseservice.db.shows.buildQuery<Show>(
    //
    //
    // ).watch(fireImmediately: true,).listen( (data) {
    //     newShows=data;
    // } );





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
    _builderShowStream= DatabaseService.db.shows.where().watch(fireImmediately: true);
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
      body: StreamBuilder<List<Show>>(
        stream: _builderShowStream,
        builder: (context, asyncSnapshot) {

          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          shows = asyncSnapshot.data ?? [];


          if (shows.isEmpty) {
            return const Center(child: Text('Shows Loading. Please wait :)'));
          }

          return ShowListView(shows: shows, scrollController: scrollController, didSelectShow: widget.didSelectShow,isSearch: false,);
        }
      ),
    );
  }
}


//ListView.builder(itemBuilder: (context,index){
//         final Show show=shows[index];
//
//       }),