

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:isar_community/isar.dart';
import 'package:tv_show_explorer/services/databaseService.dart';
import 'package:tv_show_explorer/widgets/showCard.dart';


import '../classes/show.dart';

class HomePage extends StatefulWidget {

  final ValueChanged<int> didSelectShow;
  const HomePage({super.key, required this.didSelectShow});

  @override
  State<HomePage> createState() => _HomePageState();
}








class _HomePageState extends State<HomePage> {

  late List<Show> shows=[];
  int id = 0;
  int offset=10;
  final controller=ScrollController();
  late Future<void> showFuture;
  bool isLoaded=false;
  bool isLoading=false;
  StreamSubscription? showStreamSet;
  StreamSubscription? showStreamAdd;

  late Stream<List<Show>> _builderShowStream;






  Future<void> setUpShows() async{
    if(isLoading)return;

    await Databaseservice.db.writeTxn(() async{
      await Databaseservice.db.shows.clear();
    });



    for(int count=0 ; count<offset ; count++) {

      Uri url = Uri.https('api.tvmaze.com', 'shows/$id');
      Response response = await get(url);

      if (response.statusCode == 200) {
        Show toAdd=Show(showID: id);
        await toAdd.setData();

      }else{
        count--;
      }
      setState(() {
        id++;
      });

    }




    isLoaded=true;
    //print(shows);

  }

  Future<void> addShows() async{

    if(!isLoaded)return;
    if(isLoading)return;

    isLoading=true;

    //int alreadyLoaded=shows.length;



    for(int count=0 ; count<offset ; count++) {

      Uri url = Uri.https('api.tvmaze.com', 'shows/$id');
      Response response = await get(url);

      if (response.statusCode == 200) {
        Show toAdd=Show(showID: id);
        await toAdd.setData();

      }else{
        count--;
      }

      setState(() {
        id++;
      });

    }

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
    
    controller.addListener((){
      if(controller.position.maxScrollExtent==controller.offset){
        addShows();
      }
    });
    _builderShowStream= Databaseservice.db.shows.where().watch(fireImmediately: true);
  }

  @override
  void dispose() {
    showStreamSet?.cancel();
    showStreamAdd?.cancel();
    controller.dispose();
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

          return ListView.builder(
              controller: controller,
              itemCount: shows.length+1,
              itemBuilder: (context,index){
                if(index<shows.length) {
                  final show =  shows[index];
                  return showCard(currShow: show, didSelectShow: (showID){
                    widget.didSelectShow(showID);
                  },);
                }else{
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              },
          );
        }
      ),
    );
  }
}


//ListView.builder(itemBuilder: (context,index){
//         final Show show=shows[index];
//
//       }),